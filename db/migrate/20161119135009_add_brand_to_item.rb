class AddBrandToItem < ActiveRecord::Migration
  def change
    add_column :items, :item_brand_id, :string
  end
end
