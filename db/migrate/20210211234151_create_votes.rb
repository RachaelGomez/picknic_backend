class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.boolean :is_right

      t.timestamps
    end
  end
end
