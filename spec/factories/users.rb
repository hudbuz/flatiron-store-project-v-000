FactoryGirl.define do
  factory :user do
    
  ignore do
         item {create(:item)}
 
     cart { create(:cart, line_item: line_item) }
   end
  end
end
