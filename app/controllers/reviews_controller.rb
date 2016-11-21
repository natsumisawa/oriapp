class ReviewsController < ApplicationController
  def new
    @items = Item.all
    @item_imgs = ItemImg.all
  end

end
