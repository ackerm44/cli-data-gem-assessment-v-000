module Gardening
  class Vegetable

    attr_accessor :name, :url, :intro, :recommended_varities, :cold_tolerance, :sun, :harvest_time, :notes, :soil_ph, :soil_temp

    @@all = []

    def self.create_vegetables_list(vegetable)
      self.new(vegetable.css("a[href*='growing-'] strong").text, 'http://www.growinganything.com/growing-artichokes.html')
    end

    def initialize(name = nil, url = nil)
      @name = name
      @url = url
      if self.name != ""
        @@all << self
      end
    end

    def self.all
      @@all
    end

    def self.find_by_first_letter(letter)
      self.all.select {|vegetable| vegetable.name[0] == letter}
    end

    def self.find_by_name(name)
      self.all.detect {|vegetable|  name == vegetable.name}
    end

    def varieties
      doc.css("div#ContentColumn div.Liner div.snapshot ul li[3]").first.text
    end

    def intro
      doc.css("div#ContentColumn div.Liner p").first.text
    end

    def cold_tolerance
      doc.css("div#ContentColumn div.Liner div.snapshot ul li[4]").first.text
    end

    def sun
      #may not list correctly (sun ommited from some listings)
      doc.css("div#ContentColumn div.Liner div.snapshot ul li[5]").first.text
    end

    def soil_ph
      #fix
      doc.css(("div#ContentColumn div.Liner div.snapshot ul li[1]")[2]).text
    end

    def soil_temp
      doc.css(("div#ContentColumn div.Liner div.snapshot ul li[2]")[2]).text
    end

    def harvest_time
      #may not display correctly
      doc.css("div#ContentColumn div.Liner div.snapshot ul li").last.text
    end

    def notes
      #may be including some additional characters that need to be parsed.
      doc.css("div#ContentColumn div.Liner p")[2].text
    end

    def doc
      Nokogiri::HTML(open(self.url))
    end

  end
end
