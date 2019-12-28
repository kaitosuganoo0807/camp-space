class CartsController < ApplicationController
  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to root_path
    else
      binding.pry
    end
  end

  def create2
    @cart = Cart.new(area_params)
    if @cart.save
      redirect_to root_path
    else
      binding.pry
    end
  end

  def show
    @cart = Cart.where(user_id:current_user.id)
  end

  def cart_params
    params.require(:cart).permit!
  end

  def area_params
    params.require(:cart).permit!
  end
      
end
