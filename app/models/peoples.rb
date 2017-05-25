class Peoples < ActiveRecord::Base
  has_many :favourites
  has_many :vehicles
  has_many :starships

  belongs_to :race
  belongs_to :planet
end
