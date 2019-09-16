class Olympic < ApplicationRecord
  validates :games, uniqueness: true, presence: true

  has_many :results
  has_many :events, through: :results
end
