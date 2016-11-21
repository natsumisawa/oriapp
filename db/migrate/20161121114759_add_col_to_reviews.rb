class AddColToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :item_img_id, :integer
  end
end
