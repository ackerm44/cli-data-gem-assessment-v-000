require 'nokogiri'
require 'open-uri'
require 'pry'

module Gardening
  class Scraper

    def self.scrape_vegetable_list_page(list_url)



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
      doc = Nokogiri::HTML(open(vegetable_url))

      vegetable_profile_hash = {}


      intro = doc.css("div#ContentColumn div.Liner p").first.text
      varities = doc.css("div#ContentColumn div.Liner div.snapshot ul li[3]").first.text  #remove recommended varities and :
      cold_tolerance = doc.css("div#ContentColumn div.Liner div.snapshot ul li[4]").first.text #same
      sun = doc.css("div#ContentColumn div.Liner div.snapshot ul li[5]").first.text  #may not list correctly (sun ommited from some listings)
      soil_ph = doc.css(("div#ContentColumn div.Liner div.snapshot ul li[1]")[2]).text
      soil_temp = doc.css(("div#ContentColumn div.Liner div.snapshot ul li[2]")[2]).text
      harvest = doc.css("div#ContentColumn div.Liner div.snapshot ul li").last.text
      notes = doc.css("div#ContentColumn div.Liner p")[2].text


    end


  end
end

Gardening::Scraper.scrape_vegetable_page("http://www.growinganything.com/planting-garlic.html")
