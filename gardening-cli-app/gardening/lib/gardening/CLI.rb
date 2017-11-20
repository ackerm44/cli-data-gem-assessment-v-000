module Gardening
  class CLI

    def welcome
      Gardening::Scraper.new.make_vegetables
      puts "Welcome to the Vegetable and Herb Gardening Information App"
      puts ""
      menu
    end

    def menu
      puts ""
      puts "Type the first letter of the vegetable or herb you are looking for more information on."
      puts "Or type   all    to see the whole list of vegetables and herbs to select from."
      input = gets.strip.upcase

      print_vegetable_list(input)

      puts "Type the number of the vegetable for more information on that vegetable."
      input_two = gets.strip.to_i

      selection = @short_list[input_two - 1]
      vegetable = Gardening::Vegetable.find_by_name(selection)

      print_vegetable(vegetable)

      puts ""
      puts "-------------------------------------------------------------------"
      puts "Would you like more information on another vegetable? Press Y or N."
      input_three = gets.strip

      if input_three.upcase == "Y"
        menu
      else
        puts "Thanks for visiting!"
        exit
      end

    end

    def print_vegetable_list(input)
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
      puts ""
      puts "***#{vegetable.name.upcase}***"
      puts ""
      puts "#{vegetable.intro}"
      puts ""
      puts "#{vegetable.varieties.strip}"
      puts "#{vegetable.cold_tolerance.strip}"
      puts "#{vegetable.sun.strip}"
      puts "#{vegetable.soil_ph.strip}"
      puts "#{vegetable.soil_temp.strip}"
      puts "#{vegetable.harvest_time.strip}"
      puts ""
      puts "#{vegetable.notes.strip}"

    end

  end
end
