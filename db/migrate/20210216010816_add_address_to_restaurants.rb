class AddAddressToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :address_1, :string
    add_column :restaurants, :zipcode, :string
  end
end
