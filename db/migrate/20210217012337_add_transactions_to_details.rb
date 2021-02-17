class AddTransactionsToDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :details, :transactions, :text
  end
end
