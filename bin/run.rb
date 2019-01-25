require_relative '../config/environment'

puts "Enter location"
zip = gets.strip
url = Beer.create_url(zip)
Beer.create_beers_by_url(url)
Beer.display_beers
puts "Choose a beer"
index = gets.strip.to_i
Beer.display_beer_details(index)
