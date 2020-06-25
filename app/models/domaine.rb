class Domaine < ApplicationRecord
  has_many :wines

  mount_uploader :flag, ImageUploader
end
