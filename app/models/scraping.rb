class Scraping
  def self.img
    links = []
    agent = Mechanize.new
    page = agent.get("http://www.cosme.net/item/item_id/802/products")
    elements = page.search('.item-head .item a')
    elements.each do |ele|
      links << ele[:href]
    end
    #linksにリンク先がたくさん入った
    links.each do |link|
      get_img(link)
    end
  end

  def self.get_img(link)#linkは引数
    agent = Mechanize.new
    page = agent.get(link)
    imgs = page.search(".pict img")
    imgs.each do |img|
      puts img[:src]
    end
    end
end

