class ItemImg < ActiveRecord::Base
  belongs_to :items
  has_many :reviews
end
