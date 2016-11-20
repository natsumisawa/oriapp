class ItemsController < ApplicationController
  def search
    @items = Item.where('name LIKE(?)',"%#{params[:keyword]}%").limit(20)
  end
end
