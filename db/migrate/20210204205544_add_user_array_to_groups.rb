class AddUserArrayToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :users, :string, array: true, default: []
  end
end
