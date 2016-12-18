class TopController < ApplicationController
  def index
    @imgs  = ItemImg.find([1, 100, 500, 400])
    @users = User.all
  end
end
