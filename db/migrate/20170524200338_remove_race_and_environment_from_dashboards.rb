class RemoveRaceAndEnvironmentFromDashboards < ActiveRecord::Migration[5.1]
  def change
    remove_column :dashboards, :race, :environment
  end
end
