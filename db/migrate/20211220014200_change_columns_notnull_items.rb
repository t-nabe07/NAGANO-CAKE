class ChangeColumnsNotnullItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :is_active, false
  end
end
