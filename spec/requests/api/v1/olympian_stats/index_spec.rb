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

  it 'returns json information of olympians stats' do
    get '/api/v1/olympian_stats', headers: @content_type

    expect(response).to have_http_status(:successful)

    result = JSON.parse(response.body)

    # Check response correct format
    expect(result).to have_key('olympian_stats')
    expect(result['olympian_stats']).to have_key('total_competing_olympians')
    expect(result['olympian_stats']).to have_key('average_weight')
    expect(result['olympian_stats']).to have_key('average_age')
    expect(result['olympian_stats']['average_weight']).to have_key('unit')
    expect(result['olympian_stats']['average_weight']).to have_key('male_olympians')
    expect(result['olympian_stats']['average_weight']).to have_key('female_olympians')
    # Check response correct values
    expect(result['olympian_stats']['total_competing_olympians']).to eq(Olympian.total_count)
    expect(result['olympian_stats']['average_weight']['male_olympians']).to eq(Olympian.average_male_weight.round(1))
    expect(result['olympian_stats']['average_weight']['female_olympians']).to eq(Olympian.average_female_weight.round(1))
    expect(result['olympian_stats']['average_age']).to eq(Olympian.average_age.round(1))
  end
end
