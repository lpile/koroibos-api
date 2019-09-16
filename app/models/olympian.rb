class Olympian < ApplicationRecord
  validates :name, :age, :sex, :height, :weight, :team, presence: true

  has_many :results
  has_many :olympics, through: :results
  has_many :events, through: :results

  def self.average_age
    self.average(:age)
  end

  def self.average_female_weight
    where(sex: 'F').average(:weight)
  end

  def self.average_male_weight
    where(sex: 'M').average(:weight)
  end

  def self.request_age(request)
    case request
    when 'youngest'
      order('age ASC').take
    when 'oldest'
      order('age DESC').take
    end
  end

  def self.total_count
    count(:id)
  end

  def sport
    sport_id = self.events.first.sport_id
    Sport.find_by(id: sport_id).name
  end

  def total_medals_won
    results.where("medal != 'NA'").count
  end
end
