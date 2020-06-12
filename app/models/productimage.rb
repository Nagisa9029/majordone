class Productimage < ApplicationRecord
  belongs_to :wine

  mount_uploader :image, ImageUploader
end
