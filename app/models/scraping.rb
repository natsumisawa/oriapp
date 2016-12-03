class Scraping
  def self.get_links
    links = []
    current_url = "http://www.cosme.net/item/item_id/802/products"
    while true do
      agent = Mechanize.new
      page = agent.get(current_url)
      elements = page.search('.item-head .item a')
      elements.each do |ele|
        links << ele[:href]
      end
      break unless page.at('.cmn-paging .next a')
      # あとで消す
      if current_url == "http://www.cosme.net/item/item_id/802/products/page/19"
        break
      end
      next_url = page.at('.cmn-paging .next a')[:href]
      current_url = next_url
    end
    links.each do |link|
      get_item(link)
    end
  end


  def self.get_item(link)
    agent = Mechanize.new
    page = agent.get(link)
    # brandを作る
    brand = page.at('.brd-name a').inner_text
    item_brand = ItemBrand.where(brand: brand).first_or_create
    #itemを作る
    value = page.search('.info-rating .info-desc')[2].inner_text
    name = page.at('.pdct-name a').inner_text
    item = item_brand.items.where(name: name).first_or_create
    # binding.pry
    item.update(value: value)
    #categoryとitem_categoryを作る
    category_elements = page.search('.item-category a:last')
    category_elements.each do |ele|
      category_text = ele.inner_text
      category = Category.where(category: category_text).first_or_create
      category.item_categories.where(item_id: item.id).first_or_create
    end
    #item_imgを作る(colorとitem_img)
    color_elements = page.search(".color-txt")
    img_elements = page.search(".color-pic .pic img")
    color_img_elements = color_elements.zip(img_elements)
    color_img_elements.each do |color_ele, img_ele|
      color_text = color_ele.inner_text
      item_img = ItemImg.create(item_id: item.id, color: color_text)
      # item_img.update(color: color_text)
      img_url = img_ele[:src]
      item_img.update(img_url: img_url)
    end
  end
end