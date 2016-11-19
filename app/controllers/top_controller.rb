class TopController < ApplicationController
  def index
    @img = ItemImg.order('id ASC').limit(30)
  end
end
