class Scraping
    def self.get_links
        links = []
        agent = Mechanize.new
        page = agent.get("http://www.cosme.net/item/item_id/802/products")
        elements = page.search('.item-head .item a')
        elements.each do |ele|
          links << ele[:href]
        end
    #linksに商品の詳細ページURL情報が1ページ目の10件だけ入ってる
        links.each do |link|
            get_img(link)
            get_color(link)
        end
    end

    def self.get_img(link)#linkは引数
        agent = Mechanize.new
        page = agent.get(link)
        imgs = page.search(".pic img")
        imgs.each do |img|
          puts img[:src]
        end
    end

    def self.get_color(link)
        agent = Mechanize.new
        page = agent.get(link)
        colors = page.search(".color-txt")
        colors.each do |col|
          puts col.inner_text
        end
    end
end

