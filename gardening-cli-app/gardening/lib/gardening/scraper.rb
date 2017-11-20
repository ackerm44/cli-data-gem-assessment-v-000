require 'nokogiri'
require 'open-uri'
require 'pry'

module Gardening
  class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://www.growinganything.com/vegetable-planting-guide.html"))
    end

    def scrape_vegetable_list_page
        url = self.get_page.css("div#ContentColumn div.Liner ul li a[href*='growing-']")

      # url = url.attribute('href').value
      # binding.pry
    end

    def make_vegetables
      scrape_vegetable_list_page.each do |vegetable|
        Gardening::Vegetable.create_vegetables_list(vegetable)
      end
    end
  end
end

#Gardening::Scraper.new.scrape_vegetable_list_page
