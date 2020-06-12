class WinesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @wine = Wine.new
    @wine.productimages.build
  end

  def create
    @wine = Wine.new(wine_params)
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
