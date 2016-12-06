class TopController < ApplicationController
  def index
    @imgs  = ItemImg.order('id ASC').limit(100)
    @users = User.all
  end
end
