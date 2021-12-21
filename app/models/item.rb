class Item < ApplicationRecord

 attachment :image
 belongs_to :genre
 
 def add_tax_sales_price
  (self.price * 1.10).round
 end
end
