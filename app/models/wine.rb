class Wine < ApplicationRecord
  has_many :productimages
  belongs_to :domaine
  belongs_to :wine_type
  has_many :wine_sepages
  has_many :sepages, through: :wine_sepages

  accepts_nested_attributes_for :productimages, allow_destroy: true
  mount_uploader :score_image, ImageUploader
end
