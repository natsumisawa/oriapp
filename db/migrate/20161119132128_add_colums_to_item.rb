class AddColumsToItem < ActiveRecord::Migration
  def change
    add_column :items, :brand_id, :string
  end
end
