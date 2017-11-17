module Gardening
  class CLI

    def welcome
      Gardening::Scraper.scrape_vegetable_list_page("http://www.growinganything.com/vegetable-planting-guide.html")
      puts "Welcome to the Vegetable and Herb Gardening Information App"
      puts ""
      menu
    end

    def menu
      puts "Type the first letter of the vegetable or herb you are looking for more information on."
      puts "Or type list to see the whole list of vegetables and herbs to select from."
      input = gets.strip

      print_vegetable_list(input)

      puts "Type the number of the vegetable for more information on that vegetable."
      input_two = gets.strip.to_i
    end

    def print_vegetable_list(input)
      puts ""
      puts "--------------------"
      puts "#{(input).upcase} Vegetables"
      puts "--------------------"
      puts ""

      # "Grab list of vegetables from Vegetable class @@all based on the input and print them in a numbered list"
      puts "1. Radishes"
      puts "2. Rhubarb"

    end

    def print_vegetable(input_two)
      #Either have the user type in the name of the vegetable or the index of the vegetable from the list
    end

  end
end
