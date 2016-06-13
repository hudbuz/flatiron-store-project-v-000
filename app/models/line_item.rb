class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  def self.new_line(current_user, params)
   
  if current_user.current_cart == [] or current_user.current_cart == nil or current_user.current_cart.status == 'complete'
    current_user.current_cart = Cart.create
    current_user.current_cart.add_item(params[:item_id]).save
  
  else
 
    current_user.current_cart.add_item(params[:item_id]).save
    ## creates line item if needed, increases quantity, decreases inventory
    
  end
    current_user.current_cart.save


    

  end

end
