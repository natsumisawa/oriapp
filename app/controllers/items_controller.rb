class ItemsController < ApplicationController
  def search
    @search_items = Item.where('name LIKE(?)',"%#{params[:item_keyword]}%").limit(50)
    @search_brands = ItemBrand.where('brand LIKE(?)',"%#{params[:brand_keyword]}%").limit(50)
    @items = Item.all
    @categories = Category.all
    @cat = Category.where(category: params[:category_input])
  end
end
