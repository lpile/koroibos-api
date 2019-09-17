require 'rails_helper'
require 'csv'

describe 'Event Medalists Index', type: :request do

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
    event = Event.find_by(name: "Rowing Men's Coxless Pairs")

    get "/api/v1/events/#{event.id}/medalists", headers: @content_type

    expect(response).to have_http_status(:successful)

    result = JSON.parse(response.body)

    # Check response correct format
    expect(result).to have_key('event')
    expect(result).to have_key('medalists')
    expect(result['medalists'].class).to be(Array)
    expect(result['medalists'].first).to have_key('name')
    expect(result['medalists'].first).to have_key('team')
    expect(result['medalists'].first).to have_key('age')
    expect(result['medalists'].first).to have_key('medal')
  end
end
