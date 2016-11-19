class Scraping
    def self.get_links
        links = []
        agent = Mechanize.new
        page = agent.get("http://www.cosme.net/item/item_id/802/products")
        elements = page.search('.item-head .item a')
        elements.each do |ele|
          links << ele[:href]
        end

        names = page.search('.item a')
        values = page.search('.price')
        brands = page.search('.brand a')
        categories_array = page.search('.category')

        count_number = names.count
        i = 0

        while (i != count_number) do
          name = names[i].inner_text
          value = values[i].inner_text
          brand = brands[i].inner_text
          item = Item.where(name: name).first_or_create(name: name, value: value, brand: brand)
          categories = categories_array[i].search("a")
          categories.each do |category|
            category_text = category.inner_text
            category = Category.where(category: category_text).first_or_create
            category.item_categories.create(item_id: item.id)
            # item.categories.create(category: category_text) unless Category.where(category: category_text)
          end
          link = links[i]
          get_img(link, item.id)
          i += 1
        end

    #linksに商品の詳細ページURL情報が1ページ目の10件だけ入ってる
        # links.each do |link|
        #     get_item
        #     get_img(link)
        #     get_color(link)
        # end
    end

    def self.get_img(link, item_id)#linkは引数
        agent = Mechanize.new
        page = agent.get(link)
        colors = page.search(".color-txt")
        imgs = page.search(".color-pic .pic img")

        count_number = colors.count
        i = 0

        while (i != count_number) do
          color = colors[i].inner_text
          img_url = imgs[i][:src]
          ItemImg.create(color: color, img_url: img_url, item_id: item_id)
          i += 1
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

    def self.get_category
        agent = Mechanize.new
        page = agent.get("http://www.cosme.net/item/item_id/802/products")
        categories = page.search('.category a')
        categories.each do |cat|
          category = cat.inner_text
          Category.create(category: category)
        end
    end

    def self.get_brand
        agent = Mechanize.new
        page = agent.get("http://www.cosme.net/item/item_id/802/products")
        brands = page.search('.brand a')
        brands.each do |bra|
          puts bra.inner_text
        end
    end

    def self.get_name
        agent = Mechanize.new
        page = agent.get("http://www.cosme.net/item/item_id/802/products")
        names = page.search('.item a')
        names.each do |nam|
          puts nam.inner_text
        end
    end

    def self.get_value
        agent = Mechanize.new
        page = agent.get("http://www.cosme.net/item/item_id/802/products")
        values = page.search('.price')
        values.each do |val|
          puts val.inner_text
        end
    end


end

