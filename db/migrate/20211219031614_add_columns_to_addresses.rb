class AddColumnsToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :customer, foreign_key: true
    add_column :addresses, :postcode, :string
    add_column :addresses, :address, :string
    add_column :addresses, :name, :string
  end
end
