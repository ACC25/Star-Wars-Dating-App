class AddDatetimeToFavourites < ActiveRecord::Migration[5.1]
  def change
    add_column :favourites, :created_at, :datetime
  end
end
