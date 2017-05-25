class Favourite < ActiveRecord::Base
  belongs_to :user

  has_many :peoples


  def self.love_connection(gender, smartness, species, climate)
    selection = Peoples.where(gender: gender)
    race_selection = relate_race(selection, smartness, species)
    final_selection = relate_climate(race_selection, climate)
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
    end
    output
    binding.pry
  end

end
