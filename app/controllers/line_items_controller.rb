class LineItemsController < ApplicationController

  def index

  end

  def create
  
  LineItem.new_line(current_user, params)
  redirect_to cart_path(current_user.current_cart)
  end


end
