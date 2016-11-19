class RemoveKaramsFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :color, :string
    remove_column :items, :category, :string
    remove_column :items, :img, :text
  end
end
