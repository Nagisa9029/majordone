class RootsController < ApplicationController
  def index

    # image1 = MiniMagick::Image.open('./app/assets/images/first.png')
    # array1 = Numo::DFloat.cast(image1.get_pixels)

    # image2 = MiniMagick::Image.open('./app/assets/images/graph_0.png')
    # array2 = Numo::DFloat.cast(image2.get_pixels)
  
    


    # def execute(target_file, top = 10)
    #   data_array = calc_length(target_file)
    #   data_array.sort_by { |b| b[:length] }[0..(top - 1)]
    # end

    # def calc_length(target_file)
    #   ary = []
    #   Dir.glob("./app/assets/images/*") do |item|
    #     u_image = MiniMagick::Image.open(target_file)
    #     u_numo_array = Numo::DFloat.cast(u_image.get_pixels)
    #     u_filename = target_file

    #     w_image = MiniMagick::Image.open(item)
    #     w_numo_array = Numo::DFloat.cast(w_image.get_pixels)
    #     w_filename = item

    #     temp_data_params = { file: w_filename, length: length(u_numo_array, w_numo_array) }
    #     ary << temp_data_params
    #   end
    #   ary
    # end

    # def length(array1, array2)
    #   diff_abs(array1, array2).sum
    # end

    # def diff_abs(array1, array2)
    #   (array1 - array2).abs
    # end
  

    # result = execute('./app/assets/images/first.png', 10)
    




    
    # result.each do |r|
    #   p r
    # end
  end
end
