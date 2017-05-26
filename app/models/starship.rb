class Starship < ActiveRecord::Base
  belongs_to :peoples

  def self.relate_to_match(recent_name)
    person = Peoples.find_by(name: recent_name)
    starships = Starship.where(peoples_id: person.id)
    starships.sample
  end
end
