class Wet < ApplicationRecord
  validates :date, presence: true
  belongs_to :pet
end
