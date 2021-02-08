class DropGroupsModel < ActiveRecord::Migration[6.1]
  def up
    drop_table :groups
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
