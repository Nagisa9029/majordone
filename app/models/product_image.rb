class ProductImage < ApplicationRecord
  belongs_to :wine

  mount_uploader :image, ImageUploader
end
