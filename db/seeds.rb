# class GalaxyData
#   include HTTParty
#   format :json
#   base_uri 'http://swapi.co/api/'

  def collect_races
    links = ['http://swapi.co/api/species/?page=1',
              'http://swapi.co/api/species/?page=2',
              'http://swapi.co/api/species/?page=3',
              'http://swapi.co/api/species/?page=4'
            ]
    links.each do |link|
      data = HTTParty.get(link)
      create_race_objects(data.parsed_response["results"])
    end
  end

  def create_race_objects(data)
    data.each do |race|
      Race.create!(name: race["name"],
                      classification: race["classification"],
                      designation: race["designation"],
                      api_url: race["url"]
                    )
      puts "Creating Race"
      end
  end


  def collect_planets
    links = ['http://swapi.co/api/planets/?page=1',
              'http://swapi.co/api/planets/?page=2',
              'http://swapi.co/api/planets/?page=3',
              'http://swapi.co/api/planets/?page=4',
              'http://swapi.co/api/planets/?page=5',
              'http://swapi.co/api/planets/?page=6',
              'http://swapi.co/api/planets/?page=7'
            ]
      links.each do |link|
        data = HTTParty.get(link)
        create_planet_objects(data.parsed_response["results"])
      end
    end

  def create_planet_objects(data)
    data.each do |planet|
      Planet.create!(name: planet["name"],
                      climate: planet["climate"],
                      terrain: planet["terrain"],
                      api_url: planet["url"]
                    )
      puts "Creating Planets"
      end
    end

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
        Peoples.create!(name: person["name"],
                        height: (person["height"].to_i),
                        skin_colour: person["skin_color"],
                        eye_colour: person["eye_color"],
                        gender: person["gender"],
                        race: Race.find_by(api_url: person["species"]),
                        planet_id: Planet.find_by(api_url: person["planet"]),
                        species_api: person["species"],
                        api_url: person["url"]
                      )
        puts "Creating Peoples"
      end
    end
# end


collect_planets
collect_races
collect_peoples
