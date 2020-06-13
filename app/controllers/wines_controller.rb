class WinesController < ApplicationController

  def index
    # 1000.times do |i|
    #   @testimage = Testimage.new
    #   g = Gruff::Area.new 500
    #   g.title = "My Graph"
    #   g.theme_greyscale
    #   g.maximum_value = 10

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
    #   g.write("./app/assets/images/graph_#{i}.png")
    #   image = File.open("./app/assets/images/graph_#{i}.png")
    #   @testimage.image = image
    #   @testimage.save
    # end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def new
    @wine = Wine.new
    @wine.productimages.build
  end

  def create
    @wine = Wine.new(wine_params)


    g = Gruff::Area.new 500
    g.title = "My Graph"
    g.theme_greyscale
    g.maximum_value = 10
    
    taste = []
    if @wine.attack != nil
      taste << @wine.attack
      key = taste.length - 1
      g.labels[key] = 'attack'
    end
    if @wine.body != nil
      taste << @wine.body
      key = taste.length - 1
      g.labels[key] = 'body'
    end
    if @wine.color != nil
      taste << @wine.color
      key = taste.length - 1
      g.labels[key] = 'color'
    end
    if @wine.flavor != nil
      taste << @wine.flavor
      key = taste.length - 1
      g.labels[key] = 'flavor'
    end
    if @wine.fruit_flavor != nil
      taste << @wine.fruit_flavor
      key = taste.length - 1
      g.labels[key] = 'fruit_flavor'
    end
    if @wine.sweetness != nil
      taste << @wine.sweetness
      key = taste.length - 1
      g.labels[key] = 'sweetness'
    end
    if @wine.bitterness != nil
      taste << @wine.bitterness
      key = taste.length - 1
      g.labels[key] = 'bitterness'
    end
    if @wine.acidity != nil
      taste << @wine.acidity
      key = taste.length - 1
      g.labels[key] = 'acidity'
    end
    if @wine.taste != nil
      taste << @wine.taste
      key = taste.length - 1
      g.labels[key] = 'taste'
    end
    if @wine.tannin != nil
      taste << @wine.tannin
      key = taste.length - 1
      g.labels[key] = 'tannin'
    end
    if @wine.astringency != nil
      taste << @wine.astringency
      key = taste.length - 1
      g.labels[key] = 'astringency'
    end

    g.data('data', taste)
    g.write("./app/assets/images/graph.png")

    image = File.open('./app/assets/images/graph.png')
    @wine.score_image = image
    @wine.save
    redirect_to 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def wine_params
    params.require(:wine).permit( :name,
                                  :name_spell,
                                  :title,
                                  :comment,
                                  :producer,
                                  :wine_type_id,
                                  :domaine_id,
                                  :chator,
                                  :price,
                                  :attack,
                                  :body,
                                  :color,
                                  :flavor,
                                  :fruit_flavor,
                                  :sweetness,
                                  :bitterness,
                                  :acidity,
                                  :taste,
                                  :tannin,
                                  :astringency,
                                  :score_image,
                                  :score,
                                  sepage_ids: [],
                                  productimages_attributes:[
                                      :id,
                                      :wine_id,
                                      :image,
                                      :_destroy
                                      ])
  end
end
