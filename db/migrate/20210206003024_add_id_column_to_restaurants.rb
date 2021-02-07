class AddIdColumnToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :yelp_id, :string
  end
end
