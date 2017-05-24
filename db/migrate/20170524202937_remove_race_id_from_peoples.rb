class RemoveRaceIdFromPeoples < ActiveRecord::Migration[5.1]
  def change
    remove_column :peoples, :race_id
  end
end
