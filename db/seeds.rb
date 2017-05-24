class GalaxyData
  include HTTParty
  format :json
  base_uri 'http://swapi.co/api/'

  def collect_people
    links = ['http://swapi.co/api/people/?page=1',
              'http://swapi.co/api/people/?page=2',
              'http://swapi.co/api/people/?page=3',
              'http://swapi.co/api/people/?page=4',
              'http://swapi.co/api/people/?page=5',
              'http://swapi.co/api/people/?page=6',
              'http://swapi.co/api/people/?page=7',
              'http://swapi.co/api/people/?page=8',
              'http://swapi.co/api/people/?page=9'
            ]
    links.each do |link|
      data = HTTParty.get(link)
      create_people_objects(data.parsed_response["results"])
    end
  end

  def create_people_objects(data)
      data.each do |person|
        People.create!(name: person["name"],
                        height: person["height"],
                        skin_colour: person["skin_color"],
                        eye_colour: person["eye_color"],
                        gender: person["gender"]

                      )
      end
  end

end

data = GalaxyData.new
data.collect_planets
