class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  has_many :items, :through => :line_items

  def total
    
    self.items.collect {|x| x.line_items.count * x.price}.inject(0){|sum,x| sum + x }
  end

  def add_item(item)

    item_check = self.line_items.find_by(item_id: item)
    if item_check == nil
     li = self.line_items.build(item_id: item, quantity: 1)
     inv = Item.find(item).inventory -= 1
     Item.find(item).update(inventory: inv)  
     li
    else 
   
      item_check.quantity += 1
      item_check.save
      inv = Item.find(item).inventory -= 1
      Item.find(item_check.item_id).update(inventory: inv)

      item_check
      

   end
  end

  

end
