class CreateRacesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.string :name
      t.string :classification
      t.string :designation
      t.string :api_url
    end
  end
end
