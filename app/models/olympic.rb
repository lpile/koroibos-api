class Olympic < ApplicationRecord
  validates :games, uniqueness: true, presence: true
end
