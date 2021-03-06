class Scraper

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

     imported_names.each.with_index do |name,index|
        hash_entry = {}
        hash_entry[:name] = name
        hash_entry[:type] = imported_types[index]
        hash_entry[:apv] = imported_apvs[index]
        hash_entry[:ibu] = imported_ibus[index]
        hash_entry[:brewer] = imported_brewers[index]
        hash_entry[:description] = imported_descriptions[index]
        output_of_hashes << hash_entry
     end

    output_of_hashes
    end
end
