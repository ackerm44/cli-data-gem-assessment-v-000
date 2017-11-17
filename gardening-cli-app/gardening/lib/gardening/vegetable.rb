module Gardening
  class Vegetable

    attr_accessor :name, :url, :intro, :recommended_varities, :cold_tolerance, :sun, :harvest_time, :notes, :soil_ph, :soil_temp

    @@all = []

    def self.create_vegetables_list(vegetable_list)
      vegetable_list.each do |vegetable|
        Vegetable.new(vegetable)
      end
    end

    def self.create_vegetable(vegetable_hash)
      vegetable_hash.each do |key, value|
        self.send(("#{key}="), value)
        @@all << self
      end
    end

  end
end
