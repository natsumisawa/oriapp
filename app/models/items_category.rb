class ItemsCategory < ActiveRecord::Base
  belongs_to :items
  belongs_to :categories
end
