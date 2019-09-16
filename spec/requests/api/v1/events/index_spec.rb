require 'rails_helper'
require 'csv'

describe 'Events Index', type: :request do

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

  it 'returns json information of all events' do
    get '/api/v1/events', headers: @content_type

    expect(response).to have_http_status(:successful)

    result = JSON.parse(response.body)

    # Check response correct format
    expect(result).to have_key('events')
    expect(result['events'].class).to be(Array)
    expect(result['events'].first).to have_key('sport')
    expect(result['events'].first).to have_key('events')
    expect(result['events'].first['events'].class).to be(Array)
  end
end
