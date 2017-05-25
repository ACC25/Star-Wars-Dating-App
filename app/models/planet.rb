class Planet < ActiveRecord::Base
  has_many :peoples


  def self.list_of_climates
    climates = []
    Planet.order(:climate).find_each do |planet|
      climates << planet.climate
    end
    climates.uniq!
  end
end
