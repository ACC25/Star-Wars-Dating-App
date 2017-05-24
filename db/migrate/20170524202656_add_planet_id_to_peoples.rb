class AddPlanetIdToPeoples < ActiveRecord::Migration[5.1]
  def change
    add_reference :peoples, :planet, index: true, foreign_key: true
  end
end
