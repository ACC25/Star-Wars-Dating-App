class Dashboard < ActiveRecord::Base

  def self.user_information(user)
    output = {}
    most_common = Favourite.where(user_id: user.id).order(:peoples_id).first
    person = Peoples.find(most_common.peoples_id)
    most_common_gender = Peoples.find(most_common.peoples_id).gender
    most_common_species = Race.find(person.race_id)
    count = Favourite.where(user_id: user.id).count
    output = {:most_common => person.name,
              :most_common_gender => most_common_gender,
              :most_common_species => most_common_species,
              :count => count}
  end

  def self.find_image(name)
  end
end
