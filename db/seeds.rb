Planet.destroy_all
Favourite.destroy_all
Race.destroy_all
User.destroy_all
Peoples.destroy_all
Vehicle.destroy_all

  def collect_starships
    links = ['http://swapi.co/api/starships/?page=1',
              'http://swapi.co/api/starships/?page=2',
              'http://swapi.co/api/starships/?page=3',
              'http://swapi.co/api/starships/?page=4'
            ]
      links.each do |link|
        data = HTTParty.get(link)
        create_starship_objects(data.parsed_response["results"])\
      end
  end

  def create_starship_objects(data)
    data.each do |starship|
      pilot = Peoples.find_by(api_url: starship["pilots"][0])
      Starship.create!(name: starship["name"],
                        model: starship["model"],
                        starship_class: starship["starship_class"],
                        peoples_id: pilot_verification(pilot)
                      )
    vehicle_name = starship["name"]
    puts "Creating Starship: #{vehicle_name}"
    end
  end

  def collect_vehicles
    links = ['http://swapi.co/api/vehicles/?page=1',
              'http://swapi.co/api/vehicles/?page=2',
              'http://swapi.co/api/vehicles/?page=3',
              'http://swapi.co/api/vehicles/?page=4'
            ]
    links.each do |link|
      data = HTTParty.get(link)
      create_vehicle_objects(data.parsed_response["results"])
    end

  end

  def create_vehicle_objects(data)
    data.each do |vehicle|

      pilot = Peoples.find_by(api_url: vehicle["pilots"][0])
      Vehicle.create!(name: vehicle["name"],
                      model: vehicle["model"],
                      cost_in_credit: vehicle["cost_in_credit"],
                      max_atmosphering_speed: vehicle["max_atmosphering_speed"],
                      peoples_id: pilot_verification(pilot),
                      api_url: vehicle["url"])
    vehicle_name = vehicle["name"]
    puts "Creating Vehicle: #{vehicle_name}"
    end
  end

  def pilot_verification(pilot)
    if pilot == nil
      pilot = Peoples.find(34)
      output = pilot
    else
      output = pilot
    end
    output.id
  end

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
                      api_url: race["url"][0])
      race_name = race["name"]
      puts "Creating Race: #{race_name}"
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
      planet_name = planet["name"]
      puts "Creating Planet: #{planet_name}"
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
        planet = Planet.find_by(api_url: person["homeworld"])
        Peoples.create!(name: person["name"],
                        height: (person["height"].to_i),
                        skin_colour: person["skin_color"],
                        eye_colour: person["eye_color"],
                        gender: person["gender"],
                        race_id: race_verification(race),
                        planet_id: planet_verification(planet),
                        species_api: person["species"],
                        api_url: person["url"])

        person_name = person["name"]
        puts "Creating Person: #{person_name}"
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



collect_planets
collect_races
collect_peoples
collect_vehicles
collect_starships
