class RemoveBrandidFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :brand_id, :string
  end
end
