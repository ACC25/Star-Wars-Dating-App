class AddRaceIdAgainToPeoples < ActiveRecord::Migration[5.1]
  def change
    add_reference :peoples, :race, index: true, foreign_key: true
  end
end
