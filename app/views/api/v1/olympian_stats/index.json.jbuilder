json.olympian_stats do
  json.total_competing_olympians @total_count
  json.average_weight do
    json.unit @weight_unit
    json.male_olympians number_with_precision( @average_male_weight, precision: 1).to_f
    json.female_olympians number_with_precision( @average_female_weight, precision: 1).to_f
  end
  json.average_age number_with_precision( @average_age, precision: 1).to_f
end
