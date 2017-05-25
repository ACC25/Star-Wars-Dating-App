class AddPeoplesIdToStarships < ActiveRecord::Migration[5.1]
  def change
    add_reference :starships, :peoples, index: true, foreign_key: true
  end
end
