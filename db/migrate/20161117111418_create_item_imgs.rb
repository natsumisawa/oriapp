class CreateItemImgs < ActiveRecord::Migration
  def change
    create_table :item_imgs do |t|
      t.string :color
      t.text :img_url
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
