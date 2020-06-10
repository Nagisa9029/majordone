class Wine < ApplicationRecord
  has_many :kinds
  has_many :product_images

  mount_uploader :score_image, ImageUploader
end
