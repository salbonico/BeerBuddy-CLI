require_relative '../config/environment'

class Scrapper


  def self.scrape_beers(index_url)
   html = open(index_url)
   doc = Nokogiri::HTML(html)
   binding.pry
end


##testing url for beers
self.scrape_index_page("https://www.taphunter.com/search/?type=beers&near=94611")
beer_test_url = https://www.taphunter.com/search/?type=beers&near=94611
##testing url for locations
location_test_url = "https://www.taphunter.com/search/?type=locations&near=94611"


end
