class Planet < ActiveRecord::Base
  has_many :peoples


  def self.list_of_climates
    climates = []
    Planet.order(:climate).find_each do |planet|
      climates << planet.climate
    end
    climates.uniq!
  end

  def self.relate_to_match(recent_name)
    if recent_name != "No recent searches"
      person = Peoples.find_by(name: recent_name)
      Planet.find(person.planet_id).name
    end
  end
end
