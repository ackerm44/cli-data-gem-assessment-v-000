module Gardening
  class Vegetable

    attr_accessor :name, :url, :intro, :recommended_varities, :cold_tolerance, :sun, :harvest_time, :notes, :soil_temp

    @@all = []

    def self.create_vegetables_list(vegetable)
      self.new(vegetable.css("strong").text, "http://www.growinganything.com/growing-cabbage.html")
    end

    def initialize(name = nil, url = nil)
      @name = name
      @url = url
      if self.name != "" && self.name.split.size < 3
        @@all << self
      end
    end

    def self.all
      @@all
    end

    def self.find_by_first_letter(letter)
      self.all.select {|vegetable| letter.upcase == vegetable.name[0]}
    end

    def self.find_by_name(name)
      self.all.detect {|vegetable|  name == vegetable.name}
    end

    def intro
      doc.css("div#ContentColumn div.Liner p").first.text
    end

    def varieties
      doc.css("div#ContentColumn div.Liner div.snapshot ul li[3]").first.text
    end

    def cold_tolerance
      doc.css("div#ContentColumn div.Liner div.snapshot ul li[4]").first.text
    end

    def sun
      sun = doc.css("div#ContentColumn div.Liner div.snapshot ul li[5]").first.text
    end

    def soil_temp
      doc.css("div#ContentColumn div.Liner div.snapshot ul li[3]")[1].text
    end

    def harvest_time
      doc.css("div#ContentColumn div.Liner div.snapshot ul li[1]")[4].text
    end

    def notes
      notes = doc.css("div#ContentColumn div.Liner p")[3].text
      if notes.include? "The following resources"
        notes = doc.css("div#ContentColumn div.Liner p")[4].text
      else
        notes
      end
    end

    def doc
      Nokogiri::HTML(open(self.url))
    end

  end
end
