class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :pet
end
