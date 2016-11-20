class Item < ActiveRecord::Base
  belongs_to :item_brand
  belongs_to :item_category
  has_many :item_imgs
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  has_many :item_categories
  has_many :categories, through: :item_categories

  def search
    @item = Item.where('item LIKE(?)',"%#{params[:keyword]}%").limit(20)
  end
end
