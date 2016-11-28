class TopController < ApplicationController
  def index
    @img = ItemImg.order('id ASC').limit(1000)
  end
end
