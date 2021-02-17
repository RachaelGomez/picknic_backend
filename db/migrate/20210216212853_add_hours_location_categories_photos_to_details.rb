class AddHoursLocationCategoriesPhotosToDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :details, :hours, :text
    add_column :details, :address, :text
    add_column :details, :categories, :text
    add_column :details, :photos, :text
  end
end
