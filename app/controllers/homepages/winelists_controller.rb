class Homepages::WinelistsController < ApplicationController
  def index
    @sparklingWines = Wine.search("SP", current_user, 5)
    # @blancWines = Wine.search("B", current_user, 5)
    # @rougeWines = Wine.search("R", current_user, 5)
  end

  def show
  end
end
