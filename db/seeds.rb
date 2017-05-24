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
                      api_url: race["url"][0]
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
                      api_url: planet["url"][0]
                    )
      puts "Creating Planet"
      end
    end

  def collect_peoples
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
        race = Race.find_by(api_url: person["species"][0])
        planet = Planet.find_by(api_url: person["homeworld"][0])
        Peoples.create!(name: person["name"],
                        height: (person["height"].to_i),
                        skin_colour: person["skin_color"],
                        eye_colour: person["eye_color"],
                        gender: person["gender"],
                        race_id: race_verification(race),
                        planet_id: planet_verification(planet),
                        species_api: person["species"])
        puts "Creating People"
      end
    end

    def race_verification(race)
      if race == nil
        race = Race.find_by(name: "Human")
        output = race
      else
        output = race
      end
      output.id
    end

    def planet_verification(planet)
      if planet == nil
        planet = Planet.find_by(name: "Alderaan")
        output = planet
      else
        output = planet
      end
      output.id
    end
# end


collect_planets
collect_races
collect_peoples
