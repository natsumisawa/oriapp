class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.string :color
      t.string :category
      t.string :value
      t.text :img
      t.timestamps null: false
    end
  end
end
