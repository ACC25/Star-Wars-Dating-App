class DropPeoplesVehiclesTable < ActiveRecord::Migration[5.1]
    def up
      drop_table :peoples_vehicles
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
end
