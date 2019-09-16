class Olympian < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :age, :sex, :height, :weight, :team, presence: true

  has_many :results
  has_many :olympics, through: :results
  has_many :events, through: :results
end
