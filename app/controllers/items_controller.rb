class ItemsController < ApplicationController
  def search
    @search_items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").limit(50)
    @items = Item.all
    @search_brand = ItemBrand.where('brand LIKE(?)',"%#{params[:keyword]}%").limit(50)
    @categories = Category.all
    binding.pry
    @cat = Category.where(category: params[:category_input])
  end
end
