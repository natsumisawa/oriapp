class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @items = Item.all
    @item_imgs = ItemImg.all
    @review = Review.new
    @item = Item.find(params[:item_id])
  end

  def create
    Review.create(review_params)
    redirect_to user_path(current_user)
  end

private
  def review_params
    params.require(:review).permit(:how_often, :review, :item_img_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
