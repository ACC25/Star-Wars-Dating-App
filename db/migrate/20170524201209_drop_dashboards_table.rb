class DropDashboardsTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :dashboards
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
