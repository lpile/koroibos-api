require 'rails_helper'
require 'csv'

describe 'Olympians Index', type: :request do

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

  it 'returns json information of all olympians' do
    get '/api/v1/olympians', headers: @content_type

    expect(response).to have_http_status(:successful)

    result = JSON.parse(response.body)
    
    olympian = Olympian.first

    # Check response correct format
    expect(result).to have_key('olympians')
    expect(result['olympians'].class).to be(Array)
    expect(result['olympians'].first).to have_key('name')
    expect(result['olympians'].first).to have_key('team')
    expect(result['olympians'].first).to have_key('age')
    expect(result['olympians'].first).to have_key('sport')
    expect(result['olympians'].first).to have_key('total_medals_won')
    # Check response correct values
    expect(result['olympians'].first['name']).to eq(olympian.name)
    expect(result['olympians'].first['team']).to eq(olympian.team)
    expect(result['olympians'].first['age']).to eq(olympian.age)
    expect(result['olympians'].first['sport']).to eq(olympian.sport)
    expect(result['olympians'].first['total_medals_won']).to eq(olympian.total_medals_won)
  end
end
