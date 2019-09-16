class Olympian < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :age, :sex, :height, :weight, :team, presence: true

  has_many :results
end
