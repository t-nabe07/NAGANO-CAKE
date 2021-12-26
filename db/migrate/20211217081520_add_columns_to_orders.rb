class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :customer, foreign_key: true
    add_column :orders, :postcode, :string
    add_column :orders, :address, :string
    add_column :orders, :name, :string
    add_column :orders, :payment_method, :integer
    add_column :orders, :shipping_cost, :integer
    add_column :orders, :total_payment, :integer
    add_column :orders, :status, :integer
  end
end
