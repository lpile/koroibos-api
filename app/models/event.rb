class Event < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  belongs_to :sport
  has_many :results
end
