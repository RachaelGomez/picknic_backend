class AddCityAndStateToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
  end
end
