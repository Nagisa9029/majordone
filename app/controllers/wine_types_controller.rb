class WineTypesController < ApplicationController
  before_action :authenticate_user!

  def new
    @wine_type = WineType.new
  end

  def create
    @wine_type = WineType.new(type_params)
    if @wine_type.save
      redirect_to new_wine_type_path
    else
      render :new
    end
  end
  
  private
  def type_params
    params.require(:wine_type).permit( :group)
  end
end
