require 'rails_helper'
require 'csv'

describe 'Age Request Olympian', type: :request do

  before :all do
    CSV.foreach('./spec/data/sample_olympic_data_2016.csv', headers: true, header_converters: :symbol) do |row|
      olympian = Olympian.find_or_create_by!(row.to_hash.except(:games, :sport, :event, :medal))
      olympic = Olympic.find_or_create_by!(games: row[:games])
      sport = Sport.find_or_create_by!(name: row[:sport])
      event = Event.find_or_create_by!(name: row[:event], sport_id: sport.id)
      Result.find_or_create_by!(medal: row[:medal], olympian_id: olympian.id, event_id: event.id, olympic_id: olympic.id)
    end

    @content_type = {'Content-Type': 'application/json', 'Accept': 'application/json'}
  end

  it 'returns json information of the youngest olympian' do
    get '/api/v1/olympians?age=youngest', headers: @content_type

    expect(response).to have_http_status(:successful)

    result = JSON.parse(response.body)

    olympian = Olympian.request_age('youngest')

    # Check response correct format
    expect(result.first).to have_key('name')
    expect(result.first).to have_key('team')
    expect(result.first).to have_key('age')
    expect(result.first).to have_key('sport')
    expect(result.first).to have_key('total_medals_won')
    # Check response correct values
    expect(result.first['name']).to eq(olympian.name)
    expect(result.first['team']).to eq(olympian.team)
    expect(result.first['age']).to eq(olympian.age)
    expect(result.first['sport']).to eq(olympian.sport)
    expect(result.first['total_medals_won']).to eq(olympian.total_medals_won)
  end

  it 'returns json information of the oldest olympian' do
    get '/api/v1/olympians?age=oldest', headers: @content_type

    expect(response).to have_http_status(:successful)

    result = JSON.parse(response.body)

    olympian = Olympian.request_age('oldest')

    # Check response correct format
    expect(result.first).to have_key('name')
    expect(result.first).to have_key('team')
    expect(result.first).to have_key('age')
    expect(result.first).to have_key('sport')
    expect(result.first).to have_key('total_medals_won')
    # Check response correct values
    expect(result.first['name']).to eq(olympian.name)
    expect(result.first['team']).to eq(olympian.team)
    expect(result.first['age']).to eq(olympian.age)
    expect(result.first['sport']).to eq(olympian.sport)
    expect(result.first['total_medals_won']).to eq(olympian.total_medals_won)
  end
end
