class SepagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @sepage = Sepage.new
  end

  def create
    @sepage = Sepage.new(sepage_params)
    if @sepage.save
      redirect_to new_sepage_path
    else
      render :new
    end
  end
  
  private
  def sepage_params
    params.require(:sepage).permit( :kind, :name, :name_spell, :text)
  end

end
