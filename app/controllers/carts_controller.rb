class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Cart.find(params[:id])
  end

  def create
  end

  def pay
    binding.pry
    # Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp.api_key = 'sk_test_05a7ac4d534091ea7be7cbef'
    charge = Payjp::Charge.create(
      amount: 300,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end
