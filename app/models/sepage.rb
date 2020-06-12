class Sepage < ApplicationRecord
  has_many :wine_sepages
  has_many :wines, through: :wine_sepages
end
