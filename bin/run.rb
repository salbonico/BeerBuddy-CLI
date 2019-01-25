require_relative '../config/environment'

puts "Enter location"
zip = gets.strip
url = Beer.create_url(zip)
Beer.create_beers_by_url(url)
Beer.display_beers
