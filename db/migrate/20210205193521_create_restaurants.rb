class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.integer :yelp_id

      t.timestamps
    end
  end
end
