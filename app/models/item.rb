class Item < ApplicationRecord

 attachment :image
 belongs_to :genre

 has_many :cart_items, dependent: :destroy
 has_many :order_items, dependent: :destroy

 def add_tax_sales_price
  (self.price * 1.10).round
 end

end
