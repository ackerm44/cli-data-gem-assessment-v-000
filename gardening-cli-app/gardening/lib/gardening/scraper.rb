require 'nokogiri'
require 'open-uri'
require 'pry'

module Gardening
  class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://www.growinganything.com/vegetable-planting-guide.html"))
    end

    def scrape_vegetable_on_list_page
      @vegetable = self.get_page.css("div#ContentColumn div.Liner ul li a[href*='growing-'] strong").map {|name| "#{name.text}"}
      @url = self.get_page.css("div#ContentColumn div.Liner ul a[href*='growing-']").map { |link| link['href'] }

      @vegetable.zip @url

      #binding.pry
    end

    def scrape_url_on_list_page


    end

    def make_vegetables
      #Iterate through an array of vegetable names and create a new instance of the vegetable with the
      #name and url of each vegetable
      scrape_vegetable_on_list_page.each do |vegetable, url|
        Gardening::Vegetable.create_vegetables_list(vegetable, url)
      end
      #binding.pry
    end

  end
end

Gardening::Scraper.new.scrape_vegetable_on_list_page
