class AddPhoneNumToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :phone_num, :string
  end
end
