class Testimage < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.search(current_user, top)
    data_array = []
    u_image = MiniMagick::Image.open("./public#{current_user.blancParame.score_image_url}")
    u_numo_array = Numo::DFloat.cast(u_image.get_pixels)
    u_filename = current_user.blancParame.score_image_url

    Testimage.all.each do |testimage|
      w_image = MiniMagick::Image.open("./public#{testimage.image_url}")
      w_numo_array = Numo::DFloat.cast(w_image.get_pixels)
      w_filename = testimage.image_url

      temp_data_params = { id: testimage.id, file: w_filename, length: ((u_numo_array - w_numo_array).abs).sum }
      data_array << temp_data_params
    end
    results = data_array.sort_by { |b| b[:length] }[0..(top - 1)]
    wine_id = []
    results.each do |result|
      wine_id << result[:id]
    end
    Testimage.where(id: [wine_id])
  end
end
