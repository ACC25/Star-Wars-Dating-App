class Dashboard < ActiveRecord::Base
  include HTTParty
  base_uri 'http://swapi.co/api/'


  # def self.race
  #   @options = { query: { race: race, environment: environment } }
  #   self.class.get("/race", @options)
  #   binding.pry
  # end

# def get
#   response = HTTParty.get("http://swapi.co/api/planets")
#   response.parsed_response["name"]
#   response.parsed_response["films"]
#   response.parsed_response["count"]
#   binding.pry
# end

end
