class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :google_id
      t.integer :group_id

      t.timestamps
    end
  end
end
