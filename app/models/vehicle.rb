class Vehicle < ActiveRecord::Base
  belongs_to :peoples, optional: true
end
