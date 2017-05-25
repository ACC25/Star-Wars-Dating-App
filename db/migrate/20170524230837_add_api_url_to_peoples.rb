class AddApiUrlToPeoples < ActiveRecord::Migration[5.1]
  def change
    add_column :peoples, :api_url, :string 
  end
end
