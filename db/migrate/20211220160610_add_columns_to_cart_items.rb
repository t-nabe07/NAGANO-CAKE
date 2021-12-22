class AddColumnsToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_items, :item, foreign_key: true
    add_reference :cart_items, :customer, foreign_key: true
    add_column :cart_items, :quantity, :integer
  end
end
