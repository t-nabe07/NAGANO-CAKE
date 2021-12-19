class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :genre_id, :integer
    add_column :items, :name, :string
    add_column :items, :introduction, :text
    add_column :items, :price, :integer
    add_column :items, :is_active, :boolean, default: false
    add_column :items, :image_id, :string
  end
end
