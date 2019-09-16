class Olympic < ApplicationRecord
  validates :games, uniqueness: true, presence: true

  has_many :results
end
