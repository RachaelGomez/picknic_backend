class AddNameToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :restaurant_name, :string
  end
end
