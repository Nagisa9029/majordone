class RootsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    binding.pry
  end

  def homepage 
  end

  def butler
    @rougeParame = RougeParame.new
    @blancParame = BlancParame.new
    @sparklingParame = SparklingParame.new
  end

  def create
    str = params[:taste_params].gsub(/,/, '')
    @RougeParame = RougeParame.new
    # @RougeParame.user_id = @taste_params[0]
    rouge_parame = RougeParame.input(str)
    
    @RougeParame.user_id = rouge_parame[:user_id]
    @RougeParame.attack = rouge_parame[:attack]
    @RougeParame.body = rouge_parame[:body]
    @RougeParame.color = rouge_parame[:color]
    @RougeParame.flavor = rouge_parame[:flavor]
    @RougeParame.fruit_flavor = rouge_parame[:fruit_flavor]
    @RougeParame.bitterness = rouge_parame[:bitterness]
    @RougeParame.acidity = rouge_parame[:acidity]
    @RougeParame.tannin = rouge_parame[:tannin]
    @RougeParame.astringency = rouge_parame[:astringency]
    @RougeParame.score_image = File.open('./app/assets/images/user_rouge_graph.png')
    @RougeParame.save

    # redirect_to butler_path

  end

  # private
  # def rouge_parame
  #   params.require(:rougeParame).permit(:user_id,
  #                                       :attack,
  #                                       :body,
  #                                       :color,
  #                                       :flavor,
  #                                       :fruit_flavor,
  #                                       :bitterness,
  #                                       :acidity,
  #                                       :tannin,
  #                                       :astringency,
  #                                       :score_image,
  #                                       :score)
  # end

end
