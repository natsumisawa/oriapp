class TopController < ApplicationController
  def index
    @img = ItemImg.order('id ASC').limit(50)
  end
end
