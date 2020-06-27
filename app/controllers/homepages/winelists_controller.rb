class Homepages::WinelistsController < ApplicationController
  before_action :authenticate_user!
  def index

    if SparklingParame.where(user_id: current_user.id).blank?
      @sparklingWines = []
      @blancWines = []
      @rougeWines = []
    else
      @sparklingWines = Wine.search("SP", current_user, 5)
      @blancWines = Wine.search("B", current_user, 5)
      @rougeWines = Wine.search("R", current_user, 5)
    end
  end

  def show
  end
end
