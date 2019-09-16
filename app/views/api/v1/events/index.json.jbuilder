json.events @sports do |sport|
  json.sport sport.name
  json.events sport.events, :name
end
