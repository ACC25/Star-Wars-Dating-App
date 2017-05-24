class AddPeopleIdToFavourites < ActiveRecord::Migration[5.1]
  def change
    add_reference :favourites, :peoples, index: true, foreign_key: true
  end
end
