class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
