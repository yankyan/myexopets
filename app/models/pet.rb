class Pet < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :feeds, dependent: :destroy
  has_many :molts, dependent: :destroy
end
