class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def create
  end
end