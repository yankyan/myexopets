class Pet < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :feeds, dependent: :destroy
  has_many :molts, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :mass, dependent: :destroy
  has_many :problems, dependent: :destroy
  has_many :wets, dependent: :destroy
  has_many :posts, dependent: :destroy
end
