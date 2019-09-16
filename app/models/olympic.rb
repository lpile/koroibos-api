class Olympic < ApplicationRecord
  validates :games, presence: true

  has_many :results
  has_many :events, through: :results
end
