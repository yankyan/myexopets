class Problem < ApplicationRecord
  validates :date, presence: true
  validates :desk, presence: true
  belongs_to :pet
end
