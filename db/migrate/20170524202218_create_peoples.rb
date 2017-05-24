class CreatePeoples < ActiveRecord::Migration[5.1]
  def change
    create_table :peoples do |t|
      t.string :name
      t.integer :height
      t.string :skin_colour
      t.string :eye_colour
      t.string :gender
      t.string :species_api
    end
  end
end
