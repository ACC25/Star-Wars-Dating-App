class CreateAgainJoinTablePeoplesVehicles < ActiveRecord::Migration[5.1]
  def change
      create_join_table :peoples, :vehicles do |t|
        t.references :peoples, foreign_key: true
        t.references :vehicles, foreign_key: true
      end
  end
end
