module Gardening
  class CLI

    def welcome
      Gardening::Scraper.new.make_vegetables
      puts "Welcome to the Vegetable and Herb Gardening Information App"
      puts ""
      menu
    end

    def menu
      puts "Type the first letter of the vegetable or herb you are looking for more information on."
      puts "Or type   all    to see the whole list of vegetables and herbs to select from."
      input = gets.strip

      print_vegetable_list(input)

      puts "Type the number of the vegetable for more information on that vegetable."
      input_two = gets.strip.to_i

      selection = @short_list[input_two - 1]
      puts selection
      vegetable = Gardening::Vegetable.find_by_name(selection)

      print_vegetable(vegetable)

    end

    def print_vegetable_list(input)
      puts ""
      puts "--------------------"
      puts "#{(input).upcase} Vegetables"
      puts "--------------------"
      puts ""

      @short_list = []
      if input == "all"
        Gardening::Vegetable.all.each.with_index(1) do |vegetable, i|
          puts "#{i}. #{vegetable.name}"
          @short_list << vegetable.name
        end

        #puts "testing #{@short_list[0}"
      else
        Gardening::Vegetable.find_by_first_letter(input).each.with_index(1) do |vegetable, i|
          puts "#{i}. #{vegetable}"
          @short_list << vegetable.name
        end
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
