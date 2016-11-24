class Review < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  belongs_to :item_img
end
