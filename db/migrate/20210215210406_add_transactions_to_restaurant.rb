class AddTransactionsToRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :transactions, :text, default: ''
  end
end
