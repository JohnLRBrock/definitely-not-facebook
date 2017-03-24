class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends, id: false do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end

    add_index :friends, :user_id
  end
end
