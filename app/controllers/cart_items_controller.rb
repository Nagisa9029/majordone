class CartItemsController < ApplicationController
  before_action :set_group

  def create
    cart = Cart.find(current_user.id)
    @cart_item = CartItem.new(cart_id: cart.id, wine_id: @wine.id)
    @cart_item.save
    redirect_to cart_path(cart.id)
  end

  def destroy
    cart_item = CartItem.find_by(id: params[:id], wine_id: params[:wine_id], cart_id: params[:cart_id])
    cart_item.destroy
    redirect_to cart_path(params[:cart_id])
  end

  private
  def set_group
    @wine = Wine.find(params[:wine_id])
  end
end
