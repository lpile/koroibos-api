require 'csv'

namespace :import do
  desc "Import olympic data from a CSV file"
  task :data => :environment do
    CSV.foreach('./db/data/olympic_data_2016.csv', headers: true, header_converters: :symbol) do |row|
      olympian = Olympian.find_or_create_by!(row.to_hash.except(:games, :sport, :event, :medal))
      olympic = Olympic.find_or_create_by!(games: row[:games])
      sport = Sport.find_or_create_by!(name: row[:sport])
      event = Event.find_or_create_by!(name: row[:event], sport_id: sport.id)
      Result.find_or_create_by!(medal: row[:medal], olympian_id: olympian.id, event_id: event.id, olympic_id: olympic.id)
    end
  end
end
