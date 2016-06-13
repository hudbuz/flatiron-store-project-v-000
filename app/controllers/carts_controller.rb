class CartsController < ApplicationController

  def show
    @current_user = current_user
    @current_cart = current_cart

  end

  def checkout
    
    total = current_cart.checkout(current_user)
    current_user.current_cart.update(status: 'complete')
    current_user.current_cart = nil
    flash[:notice] = "Your order has been complete."

  
    redirect_to cart_path(Cart.last)

  end

end
