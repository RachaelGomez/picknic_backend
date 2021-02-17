class ChangeAddressInDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :details, :address
    add_column :details, :address_1, :string
    add_column :details, :city, :string
    add_column :details, :state, :string
    add_column :details, :zip_code, :string
  end
end
