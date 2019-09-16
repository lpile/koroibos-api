class Olympian < ApplicationRecord
  validates :name, :age, :sex, :height, :weight, :team, presence: true

  has_many :results
  has_many :olympics, through: :results
  has_many :events, through: :results

  def sport
    sport_id = self.events.first.sport_id
    Sport.find_by(id: sport_id).name
  end

  def total_medals_won
    results.where("medal != 'NA'").count
  end
end
