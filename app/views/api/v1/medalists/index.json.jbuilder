json.event @event.name
json.medalists @medalists do |medalist|
  olympian = Olympian.find_by(id: medalist.olympian_id)
  json.name olympian.name
  json.team olympian.team
  json.age olympian.age
  json.medal medalist.medal
end
