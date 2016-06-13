class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  def self.new_line(current_user, params)
  if current_user.current_cart == []
    current_user.current_cart = Cart.create
    current_user.current_cart.add_item(params[:item_id]).save
    current_user.current_cart.line_items.find(params[:item_id]).save
  else
 
    current_user.current_cart.add_item(params[:item_id]).save
    ## creates line item if needed, increases quantity, decreases inventory
  
  end

  binding.pry

    

  end

end
