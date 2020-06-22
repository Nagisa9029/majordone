class Wine < ApplicationRecord
  has_many :productimages
  belongs_to :domaine
  belongs_to :wine_type
  has_many :wine_sepages
  has_many :sepages, through: :wine_sepages

  accepts_nested_attributes_for :productimages, allow_destroy: true
  mount_uploader :score_image, ImageUploader

  def self.search(kind, current_user, top)
    case kind
    when "SP" then
      target_file = current_user.sparklingParame.score_image_url
      wines = Wine.where(wine_type_id: 1)
    when "B" then
      target_file = current_user.blancParame.score_image_url
      wines = Wine.where(wine_type_id: 2)
    when "R" then
      target_file = current_user.rougeParame.score_image_url
      wines = Wine.where(wine_type_id: 3)
    end

    data_array = []
    u_image = MiniMagick::Image.open("./public#{target_file}")
    u_numo_array = Numo::DFloat.cast(u_image.get_pixels)
    u_filename = current_user.blancParame.score_image_url

    
    wines.each do |wine|
      w_image = MiniMagick::Image.open("./public#{wine.score_image_url}")
      w_numo_array = Numo::DFloat.cast(w_image.get_pixels)
      w_filename = wine.score_image_url

      temp_data_params = { id: wine.id, file: w_filename, length: ((u_numo_array - w_numo_array).abs).sum }
      data_array << temp_data_params
    end
    results = data_array.sort_by { |b| b[:length] }[0..(top - 1)]
    wine_id = []
    results.each do |result|
      wine_id << result[:id]
    end
    Wine.where(id: [wine_id])
  end
end