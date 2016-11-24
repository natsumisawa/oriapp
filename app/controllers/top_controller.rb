class TopController < ApplicationController
  def index
    @img = ItemImg.order('id ASC').limit(200)
  end
end
