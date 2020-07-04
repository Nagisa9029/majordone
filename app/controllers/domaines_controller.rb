class DomainesController < ApplicationController
  before_action :authenticate_user!

  def new
    @domaine = Domaine.new
  end

  def create
    @domaine = Domaine.new(domaine_params)
    if @domaine.save
      redirect_to new_domaine_path
    else
      render :new
    end
  end

  private
  def domaine_params
    params.require(:domaine).permit( :name, :flag)
  end
end
