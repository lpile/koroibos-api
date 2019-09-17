class Event < ApplicationRecord
  validates :name, presence: true

  belongs_to :sport
  has_many :results

  default_scope { order(name: :asc) }

  def medalists
    results.where.not(medal: "NA")
  end
end
