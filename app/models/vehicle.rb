class Vehicle < ActiveRecord::Base
  belongs_to :peoples

  def self.relate_to_match(recent_name)
    if recent_name != "No recent searches"
      person = Peoples.find_by(name: recent_name)
      vehicles = Vehicle.where(peoples_id: person.id)
      vehicles.sample
    end
  end
end
