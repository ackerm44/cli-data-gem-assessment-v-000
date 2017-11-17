module Gardening
  class CLI

    def welcome
      puts "Welcome to the Vegetable and Herb Gardening Information App"
      puts ""
      menu
    end

    def menu
      puts "Type the first letter of the vegetable or herb you are looking for more information on."
      puts "Or type list to see the whole list of vegetables and herbs to select from."
    end

  end
end
