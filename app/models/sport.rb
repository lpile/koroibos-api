class Sport < ApplicationRecord
  validates :name, presence: true

  has_many :events

  default_scope { order(name: :asc) }
end
