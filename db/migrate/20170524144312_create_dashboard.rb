class CreateDashboard < ActiveRecord::Migration[5.1]
  def change
    create_table :dashboards do |t|
      t.text :race
      t.text :environment
    end
  end
end
