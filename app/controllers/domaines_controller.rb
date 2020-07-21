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

  def edit
    @domaine = Domaine.find(params[:id])
  end

  def update
    @domaine = Domaine.find(params[:id])
    if @domaine.update(domaine_params)
      redirect_to domaines_path(@domaine.id + 1)
    else
      render :edit
    end
  end

  private
  def domaine_params
    params.require(:domaine).permit( :name, :flag)
  end
end
