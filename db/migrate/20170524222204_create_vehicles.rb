class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :model
      t.integer :cost_in_credit
      t.integer :max_atmosphering_speed
      t.string :api_url
    end
  end
end
