class AddPrimaryKeytoLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :id, :primary_key
  end
end
