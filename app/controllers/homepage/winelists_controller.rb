class Homepage::WinelistsController < ApplicationController
  def index

    # # サンプルデータ生成
    # 1000.times do |i|
    #   @testimage = Testimage.new
    #   g = Gruff::Area.new 500
    #   g.title = "My Graph"
    #   g.theme_greyscale
    #   g.maximum_value = 10
    #   g.minimum_value = 0


    #   taste = []
    #   9.times do
    #     taste << rand(1..10)
    #   end

    #   g.data('data', taste)
    #   g.labels = {0 => 'attack',
    #               1 => 'body',
    #               2 => 'color',
    #               3 => 'flavor',
    #               4 => 'fruit_flavor',
    #               5 => 'bitterness',
    #               6 => 'acidity',
    #               7 => 'tannin',
    #               8 => 'astringency'}
    #   g.write("./app/assets/images/sample/graph_#{i}.png")
    #   image = File.open("./app/assets/images/sample/graph_#{i}.png")

    #   @testimage.image = image
    #   @testimage.save
    # end

    # 画像比較
    def execute(target_file, top = 10)
      data_array = calc_length(target_file)
      data_array.sort_by { |b| b[:length] }[0..(top - 1)]
    end

    def calc_length(target_file)
      ary = []


      # u_image = MiniMagick::Image.open(target_file)
      # u_numo_array = Numo::DFloat.cast(u_image.get_pixels)
      # u_filename = target_file
      # @testimages = Testimage.all
      # @testimages.each do |testimage|

      Dir.glob("./app/assets/images/sample/*") do |item|
        u_image = MiniMagick::Image.open(target_file)
        u_numo_array = Numo::DFloat.cast(u_image.get_pixels)
        u_filename = target_file

        w_image = MiniMagick::Image.open(item)
        w_numo_array = Numo::DFloat.cast(w_image.get_pixels)
        w_filename = item

        temp_data_params = { file: w_filename, length: length(u_numo_array, w_numo_array) }
        ary << temp_data_params
      end
      ary
    end

    def length(array1, array2)
      diff_abs(array1, array2).sum
    end

    def diff_abs(array1, array2)
      (array1 - array2).abs
    end
  
    result = execute('./app/assets/images/user_tast_graph.png', 10)
    binding.pry


  end

  def show

  end
end
