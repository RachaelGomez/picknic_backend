class AddCategoriesToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :categories, :text
  end
end
