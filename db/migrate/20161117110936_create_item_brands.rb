class CreateItemBrands < ActiveRecord::Migration
  def change
    create_table :item_brands do |t|
    t.string :brand

      t.timestamps null: false
    end
  end
end
