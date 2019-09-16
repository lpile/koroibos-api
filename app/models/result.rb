class Result < ApplicationRecord
  validates :medal, presence: true

  belongs_to :olympian
  belongs_to :event
  belongs_to :olympic
end
