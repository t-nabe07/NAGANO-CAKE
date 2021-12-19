class AddColumnsToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :item, foreign_key: true
    add_reference :order_items, :order, foreign_key: true
    add_column :order_items, :quantity, :integer
    add_column :order_items, :making_status, :integer
    add_column :order_items, :price, :integer
    
  end
end
