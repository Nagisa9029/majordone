class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def show
    
  end

  def new

  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def desoroy
    
  end

  private
  def sepage_params
    params.require(:recipe).permit( :name)
  end

end
