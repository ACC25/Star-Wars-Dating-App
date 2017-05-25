class CreateStarships < ActiveRecord::Migration[5.1]
  def change
    create_table :starships do |t|
      t.text :name
      t.text :model
      t.text :starship_class
      t.string :pilot
    end
  end
end
