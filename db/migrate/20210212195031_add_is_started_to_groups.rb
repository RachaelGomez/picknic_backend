class AddIsStartedToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :is_started, :boolean, :null => false, :default => false
  end
end
