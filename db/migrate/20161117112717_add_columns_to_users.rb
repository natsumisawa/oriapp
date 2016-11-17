class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :icon, :string
  end
end
