class AddBusinessDetailsToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :rating, :integer
    add_column :restaurants, :price, :string
    add_column :restaurants, :image_url, :string
  end
end
