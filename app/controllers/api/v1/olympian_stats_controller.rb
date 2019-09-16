class Api::V1::OlympianStatsController < ApplicationController
  def index
    @average_age = Olympian.average_age
    @average_female_weight = Olympian.average_female_weight
    @average_male_weight = Olympian.average_male_weight
    @total_count = Olympian.total_count
    @weight_unit = 'kg'
  end
end
