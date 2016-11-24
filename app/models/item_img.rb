class ItemImg < ActiveRecord::Base
  belongs_to :item
  has_many :reviews
end
