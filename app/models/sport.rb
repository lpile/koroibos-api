class Sport < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
