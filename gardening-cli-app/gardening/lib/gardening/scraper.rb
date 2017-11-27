module Gardening
  class Scraper

    def self.get_page
      doc = Nokogiri::HTML(open("http://www.growinganything.com/vegetable-planting-guide.html"))
    end

    def self.scrape_vegetable_on_list_page
      # Due to the nature of the HTML/CSS, vegetable and url data for the list of vegetables had to be scraped
      # separately and zipped together into an array before the make_vegetables method iterates over the zipped array.
      vegetable = self.get_page.css("div#ContentColumn div.Liner ul li a[href*='growing-'] strong").map {|name| "#{name.text}"}
      url = self.get_page.css("div#ContentColumn div.Liner ul a[href*='growing-']").map { |link| link['href'] }

      vegetable.zip url
    end

    def self.make_vegetables
      self.scrape_vegetable_on_list_page.each do |vegetable, url|
        Gardening::Vegetable.create_vegetables_list(vegetable, url)
      end
    end
  end
end
