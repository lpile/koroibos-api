json.olympians @olympians, :name, :team, :age, :sport, :total_medals_won if @olympians
json.array! [@olympian], :name, :team, :age, :sport, :total_medals_won if @olympian
