class AddUserIdToFavourites < ActiveRecord::Migration[5.1]
  def change
    add_reference :favourites, :user, index: true, foreign_key: true
  end
end
