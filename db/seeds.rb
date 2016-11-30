# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

categories_csv = CSV.readlines("db/categories.csv")
categories_csv.shift
categories_csv.each do |row|
  Categories.create(category: row[1])
end

item_categories_csv = CSV.readlines("db/item_categories.csv")
item_categories_csv.shift
item_categories_csv.each do |row|
  item_categories.create(item_id: row[1], category_id: row[2])
end

item_brands_csv = CSV.readlines("db/item_brands.csv")
item_brands_csv.shift
item_brands_csv.each do |row|
  item_brands.create(brand: row[1])
end

item_categories_csv = CSV.readlines("db/item_categories.csv")
item_categories_csv.shift
item_categories_csv.each do |row|
  item_categories.create(item_id: row[1], category_id: row[2])
end

item_imgs_csv = CSV.readlines("db/item_imgs.csv")
item_imgs_csv.shift
item_imgs_csv.each do |row|
  item_imgs.create(color: row[1], img_url: row[2], item_id: row[3])
end

items_csv = CSV.readlines("db/items.csv")
items_csv.shift
items_csv.each do |row|
  items.create(name: row[1], brand: row[2], value: row[3])
end
