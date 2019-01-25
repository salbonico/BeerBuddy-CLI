require_relative '../config/environment'

class Beer
@@all =[]

attr_accessor :name,:type,:apv,:ibu,:brewer,:description

def initialize(input)
@name = input[:name]
@type = input[:type]
@apv = input[:apv]
@ibu = input[:ibu]
@brewer = input[:brewer]
@description = input[:description]
@@all << self
end

def self.all
@@all
end

def self.create_url(zip)
return "https://www.taphunter.com/search/?type=beers&near=#{zip}"
end


def self.create_beers_by_url(url)
  @@all.clear
  input_hash = Scraper.scrape_beers(url)
  6.times {input_hash.pop}
  input_hash.each do |hash|
    Beer.new(hash)
  end

end

def self.display_beers
@@all.each.with_index do |beer,index|
display_index = index + 1
puts "#{display_index}) #{beer.name} -- #{beer.type}"
end

end

end
