class Favourite < ActiveRecord::Base
  belongs_to :user

  has_many :peoples


  def self.find_most_recent(user)
    if check_account_history?(user)
      recent_search = Favourite.where(user_id: user.id).order(:created_at).last
      person = Peoples.find(recent_search.id)
      person.name
    else
      "No recent searches"
    end
  end

  def self.check_account_history?(user)
    recent_search = Favourite.where(user_id: user.id).order(:created_at).last
    if recent_search != nil
      true
    end
  end

  def self.love_connection(gender, smartness, species, climate)
    selection = Peoples.where(gender: gender)
    race_selection = relate_race(selection, smartness, species)
    climate_selection = relate_climate(race_selection, climate)
    final_selection = relate_person_to_climate(race_selection, climate_selection)
  end

  def self.relate_race(selection, smartness, species)
    qualifying_candidates = []
    selection.each do |person|
      if race?(person, smartness, species)
        qualifying_candidates << person
      end
    end
    qualifying_candidates
  end

  def self.race?(person, smartness, species)
    species_search = Race.find_by(name: species.capitalize, designation: smartness.downcase)
    if species_search != nil
      true
    end
  end

  def self.relate_climate(race_selection, climate)
    output = []
    if climate == "Sandy"
      output = Planet.where('climate LIKE ? OR climate LIKE ? OR climate LIKE ? OR climate LIKE ?', 'arid', 'superheated', 'arid, temperate, tropical', 'arid, rocky, windy')
    elsif climate == "Snowy"
      output = Planet.where('climate LIKE ? OR climate LIKE ? OR climate LIKE ? OR climate LIKE ?' ,'frozen', 'temperate, arid, subartic', 'temperate, artic', 'artic')
    elsif climate == "Blue Sky"
      output = Planet.where('climate LIKE ? OR climate LIKE ?', 'temperate', 'tropical, temperate')
    elsif climate == "Anything"
      output = Planet.where('climate LIKE ? OR climate LIKE ? OR climate LIKE ? OR climate LIKE ?', 'temperate', 'arid', 'tropical', 'frozen')
    end
    output
  end

  def self.relate_person_to_climate(race_selection, climate_selection)
    output = []
    climate_selection.each do |climate|
      race_selection.each do |person|
        if climate.id == person.planet_id
          output << person
        end
      end
    end
    output.sample
  end

end
