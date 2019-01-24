class Beer
@@all =[]

attr_accessor :name :type :apv :ibu :brewer :description :link_to_tocation

def initialize(input)
@name = input[:name]
@type = input[:type]
@apv = input[:apv]
@ibu = input[:ibu]
@brewer = input[:brewer]
@description = input[:description]
@link_to_tocation = input[:link_to_tocation]

@@all << self
end

def self.all
@@all
end



end
