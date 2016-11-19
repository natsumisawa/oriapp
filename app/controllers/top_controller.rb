class TopController < ApplicationController
  def index
    @img = ItemImg.order('id ASC').limit(10)
  end
end
