class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])#URLを踏んだ時にユーザーのidがparamsで送られてくる、それを利用する
  end
end