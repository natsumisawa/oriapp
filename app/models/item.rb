class Item < ActiveRecord::Base
  belongs_to :item_brands
  belongs_to :item_categories
  has_many :item_imgs
  belongs_to :users
  has_many :reviews
  has_many :users, through: :reviews
  has_many :item_categories
  has_many :categories, through: :items_categories

end
