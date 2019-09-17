json.events @sports do |sport|
  @events = sport.events.map { |event| event.name }
  json.sport sport.name
  json.events do
    json.array! @events
  end
end
