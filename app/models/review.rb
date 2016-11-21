class Review < ActiveRecord::Base
  belongs_to :items
  belongs_to :users
  belongs_to :item_img
end
