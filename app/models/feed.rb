class Feed < ApplicationRecord
  validates :date, presence: true
  belongs_to :pet
end
