class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])#URLを踏んだ時にユーザーのidがparamsで送られてくる、それを利用する
    @reviews = Review.where(user_id: params[:id])
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:user_name, :icon)
  end

end
