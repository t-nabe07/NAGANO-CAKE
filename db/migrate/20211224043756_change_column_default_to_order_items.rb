class ChangeColumnDefaultToOrderItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :order_items, :making_status, from: nil, to: "0"
  end
end
