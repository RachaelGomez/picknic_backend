class ChangeYelpIdToString < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :yelp_id
  end
end
