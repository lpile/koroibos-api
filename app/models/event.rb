class Event < ApplicationRecord
  validates :name, presence: true

  belongs_to :sport
  has_many :results
end
