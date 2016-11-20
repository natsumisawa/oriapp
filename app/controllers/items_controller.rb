class ItemsController < ApplicationController
  def search
    @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").limit(20)
    @category_search_items = Item.find(25)
  end
end
