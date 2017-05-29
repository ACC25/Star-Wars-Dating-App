class Favourite < ActiveRecord::Base
  belongs_to :user

  has_many :peoples

  def self.love_connection(gender, smartness, species, climate)
    selection = Peoples.where(gender: random_gender?(gender))
    if selection.count == 1
      selection
    else
      race_selection = relate_race(selection, smartness, species)
      climate_selection = relate_climate(race_selection, climate)
      final_selection = relate_person_to_climate(race_selection, climate_selection)
      verify_final(final_selection)
    end
  end

  def self.find_most_recent(user)
    if check_account_history?(user)
      recent_search = Favourite.where(user_id: user.id).order(:created_at).last
      person = Peoples.find(recent_search.peoples_id)
      person_valid?(person)
    else
      "No recent searches"
    end
  end

  def self.person_valid?(person)
    if person == nil
      "No recent searches"
    else
      person.name
    end
  end

  def self.find_image(person)
    if person == "No recent searches"
      result = "https://i.imgur.com/NlLpf53.png"
    elsif person == "Jar Jar Binks"
      result = "https://i.imgur.com/q8UNfXf.jpg"
    elsif person == "Darth Vader"
      result = "https://i.imgur.com/Iswi6fL.jpg?1"
    elsif person == "Obi-Wan Kenobi"
      result = "https://i.imgur.com/VFuBjyn.jpg"
    elsif person == "Anakin Skywalker"
      result = "https://i.imgur.com/p6MF37O.jpg"
    else
      options = {}
      options[:searchType] = "image"
      results = GoogleCustomSearchApi.search(person, options)
      result = results["items"][0]["link"]
    end
  end

  def self.find_wiki_links(person)
    options = {}
    results = GoogleCustomSearchApi.search(person, options)
    result = results["items"][0]["link"]
  end

  private

  def self.random_gender?(gender)
    if gender == "None"
      genders = []
      Peoples.order(:gender).each do |person|
        genders << person.gender
      end
      genders.uniq!.sample
    else
      gender
    end
  end

  def self.relate_race(selection, smartness, species)
    qualifying_candidates = []
    selection.each do |person|
      if race?(person, smartness, species)
        if species?(person, species)
          qualifying_candidates << person
        end
      end
    end
    qualifying_candidates
  end

  def self.race?(person, smartness, species)
      species_search = Race.find_by(id: person.race_id)
        if species_search != nil
          true
        end
  end

  def self.species?(person, species)
    if species == "Random"
      true
    elsif species == "Human"
      race = Race.find(person.race_id).id
      if race == 36
        true
      end
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


def self.verify_final(final_selection)
  if final_selection == nil
    output = Peoples.find_by(name: "Jar Jar Binks")
  else
    output = final_selection
  end
  output.id
end



def self.check_account_history?(user)
  recent_search = Favourite.where(user_id: user.id).order(:created_at).last
  if recent_search != nil
    true
  end
end
end
