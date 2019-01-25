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
  self.all.clear
  input_hash = Scraper.scrape_beers(url)
  6.times {input_hash.pop}
  input_hash.each do |hash|
    Beer.new(hash)
  end

end

def self.display_beers
index = 0
until index == 10
display_index = index + 1
puts "#{display_index}) #{@@all[index].name} -- #{@@all[index].type}"
index += 1
end
end

def self.display_beer_details(index)
index -= 1
selected_beer = @@all[index]
puts "#{selected_beer.name}"
puts "#{selected_beer.type} by #{selected_beer.brewer}"
puts "#{selected_beer.apv} #{selected_beer.ibu}"
puts "#{selected_beer.description}"
end

end
