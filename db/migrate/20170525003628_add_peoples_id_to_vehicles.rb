class AddPeoplesIdToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_reference :vehicles, :peoples, index: true, foreign_key: true
  end
end
