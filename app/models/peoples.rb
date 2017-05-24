class Peoples < ActiveRecord::Base
  has_many :favourites

  belongs_to :race
  belongs_to :planet
end
