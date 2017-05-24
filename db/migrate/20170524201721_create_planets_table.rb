class CreatePlanetsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :climate
      t.string :terrain
      t.string :api_url
    end
  end
end
