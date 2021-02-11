class AddRestaurantIdToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :group_id, :integer
  end
end
