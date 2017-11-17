module Gardening
  class CLI

    def welcome
      puts "Welcome to the Vegetable and Herb Gardening Information App"
      puts ""
      #Scraper.new.scrape_vegetable_list_page("http://www.growinganything.com/vegetable-planting-guide.html")
      menu
    end

    def menu
      puts "Type the first letter of the vegetable or herb you are looking for more information on."
      puts "Or type list to see the whole list of vegetables and herbs to select from."
    end

  end
end
