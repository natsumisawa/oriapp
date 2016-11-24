class ItemImgsController < ApplicationController
  def show
    @item_imgs = Item_img.all
  end
end
