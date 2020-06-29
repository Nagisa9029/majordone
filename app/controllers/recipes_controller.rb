class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def show
    
  end

  def new
    @sepage = Sepage.new
  end

  def create
    @sepage = Sepage.new(sepage_params)
    @sepage.save
    
  end

  def edit
    
  end

  def update
    
  end

  def desoroy
    
  end

  private
  def sepage_params
    params.require(:sepage).permit( :kind, :name, :name_spell, :text)
  end

end
