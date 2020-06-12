class WinesController < ApplicationController

  def index

    # g = Gruff::Line.new 500
    # g.title = "My Graph"

    # g.theme_37signals

    # g.data('date1', [1, 3, 3, 6, 5, 4])
    # g.data('date1', [1, 8, 7, 10, 5, 7])
    # g.data('date1', [3, 2, 6, 2, 8, 9])
    # g.data('date1', [3, 5, 6, 7, 3, 4])

    # g.labels = {0 => '2010/01', 2 => '2010/03', 4 => '2010/05'}
    # binding.pry
    # g.write('./app/assets/images/graph.png')

    # file = './app/assets/images/graph.png'
 

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
