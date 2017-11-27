module Gardening
  class CLI

    def welcome
      Gardening::Scraper.make_vegetables
      puts ""
      puts "**************************************************"
      puts "Welcome to the Vegetable Gardening Information App"
      puts "**************************************************"
      menu
    end

    def menu
      # Prints first and secondary lists and asks for user input both times while trying to account for bad input
      puts ""
      puts "- Type the first letter of the vegetable you are looking for more information on."
      puts "- Or type  ALL  to see the whole list of vegetables to select from."
      puts "- Or type 10 to see the first ten vegetables."
      puts ""
      input = gets.strip.upcase

      print_vegetable_list(input)

      puts ""
      puts "Type the number of the vegetable for more information on that vegetable."
      short_list_selection = gets.strip.to_i

      while short_list_selection > @short_list.length || short_list_selection == 0
        puts "Type the number of the vegetable for more information on that vegetable."
        short_list_selection = gets.strip.to_i
      end

      vegetable = Gardening::Vegetable.find_by_name(@short_list[short_list_selection - 1])
      print_vegetable(vegetable)

      puts ""
      puts "-------------------------------------------------------------------"
      puts "Would you like more information on another vegetable? Press Y or N."
      play_again = gets.strip

      if play_again.upcase == "Y"
        menu
      else
        puts "**************************************************"
        puts "Thanks for visiting!"
        puts "**************************************************"
        exit
      end

    end

    def print_vegetable_list(input)
      # Prints out initial list based on users choice of ALL or letter and accounts for possibilities of bad input
      @short_list = []
      if input == "ALL"
        puts ""
        puts "--------------------"
        puts "#{input} Vegetables"
        puts "--------------------"
        puts ""
        Gardening::Vegetable.all.each.with_index(1) do |vegetable, i|
          puts "#{i}. #{vegetable.name}"
          @short_list << vegetable.name
        end
      elseif input == "10"
      puts ""
      puts "--------------------"
      puts "First #{input} Vegetables"
      puts "--------------------"
      puts ""
      i = 1
      while counter <= 10
        Gardening::Vegetable.all.each.with_index(1) do |vegetable, i|
        puts "#{i}. #{vegetable.name}"
        counter += 1
      end
        
      elsif Gardening::Vegetable.find_by_first_letter(input) == []
        puts ""
        puts "--There are no vegetables under that letter.--"
        puts "----------------------------------------------"
        menu
      elsif input.scan(/[A-Z]/)
        puts ""
        puts "--------------------"
        puts "#{input} Vegetables"
        puts "--------------------"
        puts ""
        Gardening::Vegetable.find_by_first_letter(input).each.with_index(1) do |vegetable, i|
          puts "#{i}. #{vegetable.name}"
          @short_list << vegetable.name
        end
      else
        puts "Input must be a letter or ALL"
        menu
      end
    end

    def print_vegetable(vegetable)
      # Prints out secondary list of an individual vegetable
      puts ""
      puts "*************#{vegetable.name.upcase}*************"
      puts ""
      puts "#{vegetable.intro}"
      puts ""
      puts "VARIETIES"
      puts "---------"
      puts "#{vegetable.varieties.strip}"
      puts ""
      puts "OPTIMAL GROWING CONDITIONS & INFORMATION"
      puts "----------------------------------------"
      puts "#{vegetable.cold_tolerance.strip}"
      puts "#{vegetable.sun.strip}"
      puts "#{vegetable.soil_temp.strip}"
      puts "#{vegetable.harvest_time.strip}"
      puts ""
      puts "ADDITIONAL INFORMATION:"
      puts "-----------------------"
      puts "#{vegetable.notes.strip}"

    end
  end
end
