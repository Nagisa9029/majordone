class CartItemsController < ApplicationController
  before_action :set_group

  def create
    cart = Cart.where(user_id: current_user.id)
    if cart == []
      cart = Cart.new
      cart.user_id = current_user.id
      cart.save
    end
    @cart_item = CartItem.new(cart_id: current_user.cart.id, wine_id: @wine.id)
    @cart_item.save
    redirect_to cart_path(current_user.cart.id)
  end

  def destroy
    
  end

  private
  def set_group
    @wine = Wine.find(params[:wine_id])
  end
end
