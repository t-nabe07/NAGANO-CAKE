class Item < ApplicationRecord

 attachment :image
 belongs_to :genre
 has_many :cart_items, dependent: :destroy
 
 #商品の税込価格
 def add_tax_sales_price
  (self.price * 1.10).round
 end
end
