class Mass < ApplicationRecord
  validates :date, presence: true
  validates :mass, presence: true

  belongs_to :pet
end
