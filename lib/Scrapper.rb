require_relative '../config/environment'

class Scrapper


  def self.scrape_beers(index_url)
   html = open(index_url)
   doc = Nokogiri::HTML(html)
   output_of_hashes = []

   test_scrape = doc.css("p:nth-child(2) span:nth-child(2)").text

#beer name scrape
imported_names = []
  doc.css("h4").each do |name|
    imported_names << name.text
end

#beer type scrape
imported_types = []
  doc.css("p:nth-child(2) span:nth-child(1)").each do |type|
   imported_types << type.text
 end

#beer APV scrape
imported_apvs = []
  doc.css("p:nth-child(2) span:nth-child(2)").each do |apv|
    imported_apvs << apv.text
end

#beer IBU scrape
imported_ibus = []
  doc.css("p:nth-child(2) span:nth-child(3)").each do |ibu|
    imported_ibus << ibu.text
end

#beer brewer scrape
imported_brewers = []
  doc.css("p:nth-child(3) span:nth-child(1)").each do |brewer|
    imported_brewers << brewer.text
end

#beer description scrape
imported_descriptions = []
  doc.css("em").each do |description|
    imported_descriptions << description.text
end



   binding.pry
end


##testing url for beers
self.scrape_beers("https://www.taphunter.com/search/?type=beers&near=94611")
beer_test_url = "https://www.taphunter.com/search/?type=beers&near=94611"
##testing url for locations
location_test_url = "https://www.taphunter.com/search/?type=locations&near=94611"


end
