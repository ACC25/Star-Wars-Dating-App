class AddColumnToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :pilot, :string
  end
end
