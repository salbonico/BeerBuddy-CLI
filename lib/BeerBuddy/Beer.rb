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

  def self.all_clear
    @@all.clear
  end

end
