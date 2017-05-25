class RemovePilotsFromVehicles < ActiveRecord::Migration[5.1]
  def change
    remove_column :vehicles, :pilot
  end
end
