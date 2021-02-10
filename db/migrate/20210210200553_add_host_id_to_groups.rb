class AddHostIdToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :host_name, :string
  end
end
