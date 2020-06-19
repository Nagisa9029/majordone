class RootsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def homepage
  end

  def butler
  end

  def create
    str = params[:taste_params].gsub(/,/, '')
    @blancParame = BlancParame.new
    blanc_parame = BlancParame.input(str)

    @blancParame.user_id = blanc_parame[:user_id]
    @blancParame.attack = blanc_parame[:attack]
    @blancParame.body = blanc_parame[:body]
    @blancParame.color = blanc_parame[:color]
    @blancParame.flavor = blanc_parame[:flavor]
    @blancParame.fruit_flavor = blanc_parame[:fruit_flavor]
    @blancParame.sweetness = blanc_parame[:sweetness]
    @blancParame.acidity = blanc_parame[:acidity]
    @blancParame.taste = blanc_parame[:taste]
    @blancParame.score_image = File.open('./app/assets/images/user_blanc_graph.png')
    @blancParame.save

    @rougeParame = RougeParame.new
    rouge_parame = RougeParame.input(str)
    
    @rougeParame.user_id = rouge_parame[:user_id]
    @rougeParame.attack = rouge_parame[:attack]
    @rougeParame.body = rouge_parame[:body]
    @rougeParame.color = rouge_parame[:color]
    @rougeParame.flavor = rouge_parame[:flavor]
    @rougeParame.fruit_flavor = rouge_parame[:fruit_flavor]
    @rougeParame.bitterness = rouge_parame[:bitterness]
    @rougeParame.acidity = rouge_parame[:acidity]
    @rougeParame.tannin = rouge_parame[:tannin]
    @rougeParame.astringency = rouge_parame[:astringency]
    @rougeParame.score_image = File.open('./app/assets/images/user_rouge_graph.png')
    @rougeParame.save

    @sparklingParame = SparklingParame.new
    sparkling_parame = SparklingParame.input(str)

    @sparklingParame.user_id = sparkling_parame[:user_id]
    @sparklingParame.attack = sparkling_parame[:attack]
    @sparklingParame.body = sparkling_parame[:body]
    @sparklingParame.color = sparkling_parame[:color]
    @sparklingParame.flavor = sparkling_parame[:flavor]
    @sparklingParame.fruit_flavor = sparkling_parame[:fruit_flavor]
    @sparklingParame.sweetness = sparkling_parame[:sweetness]
    @sparklingParame.bitterness = sparkling_parame[:bitterness]
    @sparklingParame.acidity = sparkling_parame[:acidity]
    @sparklingParame.taste = sparkling_parame[:taste]
    @sparklingParame.score_image = File.open('./app/assets/images/user_sparkling_graph.png')
    @sparklingParame.save

    redirect_to butler_root_path

  end
end

