class CLI
  def create_url(zip)
    "https://www.taphunter.com/search/?type=beers&near=#{zip}"
  end

  def create_beers_by_url(url)
    Beer.all_clear
    input_hash = Scraper.scrape_beers(url)
    6.times {input_hash.pop}
      input_hash.each do |hash|
        Beer.new(hash)
      end
  end

  def display_beers
    if Beer.all == []
      puts "Oh no! You've found a beer desert!"
      self.activate_buddy
    end
    index = 0
      until index == 10
        display_index = index + 1
        puts "#{display_index}) #{Beer.all[index].name} -- #{Beer.all[index].type}"
        index += 1
      end
    puts "Choose a number by the beer you want to learn more about!"
    input = gets.strip.to_i
      if input > 0 && input <11
        self.display_beer_details(input)
      else
        self.display_beers
      end
  end

  def display_beer_details(index)
    index -= 1
    selected_beer = Beer.all[index]
    puts "#{selected_beer.name}"
    puts "#{selected_beer.type} by #{selected_beer.brewer}"
    puts "#{selected_beer.apv} #{selected_beer.ibu}"
    puts "#{selected_beer.description}"
    puts ""
    puts "--------------------------"
    puts "1) Back to list of beers."
    puts "2) Enter a new location."
    puts "3) Exit"
    input = gets.strip.to_i
      if input == 1
        self.display_beers
      elsif input == 2
        self.activate_buddy
      elsif input == 3
        puts "Bye buddy!"
      else
        self.display_beers
      end
  end

  def activate_buddy
    puts "Hey buddy! Where are you? Enter a zip or town."
    location = gets.strip
    url = self.create_url(location)
    self.create_beers_by_url(url)
    self.display_beers
  end

end
