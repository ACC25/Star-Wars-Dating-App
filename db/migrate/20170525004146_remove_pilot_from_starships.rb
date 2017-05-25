class RemovePilotFromStarships < ActiveRecord::Migration[5.1]
  def change
    remove_column :starships, :pilot
  end
end
