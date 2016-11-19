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
        brand = page.search('.brand a')

        count_number = names.count
        i = 0

        while (i != count_number) do
          name = names[i].inner_text
          value = values[i].inner_text
          brand = brands[i].inner_text

          item_brand = ItemBrand.where(brand: brand).first_or_create(brand: brand)

          item = item_brand.items.where(name: name).first_or_create(name: name, value: value)

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


    def self.get_brand
        agent = Mechanize.new
        page = agent.get("http://www.cosme.net/item/item_id/802/products")
        brands = page.search('.brand a')
        brands.each do |bra|
          puts bra.inner_text
        end
    end

end

