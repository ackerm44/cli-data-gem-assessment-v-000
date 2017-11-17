require 'nokogiri'
require 'open-uri'
require 'pry'

module Gardening
  class Scraper

    def self.scrape_vegetable_list_page(list_url)
      #list_url = File.read(list_url)
      doc = Nokogiri::HTML(open(list_url))

      vegetable_array = []

      vegetables = doc.css("div#ContentColumn div.Liner ul li")
      vegetables.each do |vegetable|
        vegetable = vegetable.css("a strong").text
        vegetable_array << vegetable
      end

      vegetable_array.delete_if{ |v| v == "" || v == "More veggie guides coming soon" || v == "Vegetable Garden Tips" || v == "GrowingAnything.com Organic Gardening Advice Home Page" || v == "Vegetable Planting Guide"}

    end

    def self.scrape_vegetable_page(vegetable_url)
    end


  end
end

Gardening::Scraper.scrape_vegetable_list_page("http://www.growinganything.com/vegetable-planting-guide.html")
