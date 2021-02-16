class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.string :price
      t.string :url
      t.string :phone
      t.string :image_url
      t.string :name
      t.float :rating
      t.string :yelp_id

      t.timestamps
    end
  end
end
