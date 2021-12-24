class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  enum making_status: { impossible:0, wating_for_making:1, be_making:2, has_been_shiped:3 }
  
  def add_tax_sales_price
    (self.price * 1.10).round
  end
  
  def subtotal
    item.add_tax_sales_price * quantity
  end
  
  def total_quantity
    OrderItem.sum(:quantity)
  end
  
end
