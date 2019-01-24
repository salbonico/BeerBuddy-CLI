require_relative '../config/environment'

class Scrapper


  def self.scrape_index_page(index_url)
   html = open(index_url)
   doc = Nokogiri::HTML(html)
   binding.pry
end

self.scrape_index_page("https://www.taphunter.com/search/?type=beers&near=94611")

end
