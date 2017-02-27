class Photo < ApplicationRecord
  has_attached_file :image, styles: {large:"600x600>", medium: "360x240#", thumb: "240x180#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :pet
end
