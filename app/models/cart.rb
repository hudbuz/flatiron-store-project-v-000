class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  has_many :items, :through => :line_items

  def total
    total = 0
    #self.items.collect {|x| x.line_items.count * x.price}.inject(0){|sum,x| sum + x }
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    total
  end

  def add_item(item)

    item_check = self.line_items.find_by(item_id: item)
    if item_check == nil
     li = self.line_items.build(item_id: item, quantity: 1)
       
     li
    else 
   
      item_check.quantity += 1
      item_check.save
     

      item_check
      

   end
  end

  def checkout(current_user)
    total_price = 0
    current_user.current_cart.line_items.each do |line_item|
      total_price += line_item.item.price * line_item.quantity
      inv = line_item.item.inventory -= line_item.quantity
      line_item.item.update(inventory: inv) 
    end
    total_price
  end

  

end


# inv = Item.find(item).inventory -= 1
    #  Item.find(item_check.item_id).update(inventory: inv)

#