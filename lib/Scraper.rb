require_relative '../config/environment'

class Scrapper


   def self.scrape_beers(url)
   html = open(url)
   doc = Nokogiri::HTML(html)
   output_of_hashes = []




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

#beer link to locations scrape

full_url_scrap = []
doc.css("h4 a").each do |url|
full_url_scrap << url.attribute("href")
end

imported_link_to_locations = []
full_url_scrap.each do |hash|
imported_link_to_locations << hash.value
end

imported_names.each.with_index do |name,index|
  hash_entry = {}
  hash_entry[:name] = name
  hash_entry[:type] = imported_types[index]
  hash_entry[:apv] = imported_apvs[index]
  hash_entry[:ibu] = imported_ibus[index]
  hash_entry[:brewer] = imported_brewers[index]
  hash_entry[:description] = imported_descriptions[index]
  hash_entry[:link_to_location] = imported_link_to_locations[index]
  output_of_hashes << hash_entry
end

end

def self.scrape_locations(url)
  html = open(url)
  doc = Nokogiri::HTML(html)
  output_of_hashes = []

  test_scrape = doc.css("div .media-body p:not(.separated):not(.offer)")








#location name scrape
  imported_loc_names = []
  doc.css("h4").each do |name|
  imported_loc_names << name.text
end

#location description scrape
  imported_loc_descriptions = []
  doc.css("div .media-body p:not(.separated):not(.offer)").each do |description|
  imported_loc_descriptions << description.text 
end

binding.pry
end






##testing url for beers
#self.scrape_beers("https://www.taphunter.com/search/?type=beers&near=94611")
beer_test_url = "https://www.taphunter.com/search/?type=beers&near=94611"
##testing url for locations

location_test_url = "https://www.taphunter.com/search/?type=locations&near=94611"
self.scrape_locations("https://www.taphunter.com/search/?type=locations&near=94611")
end
