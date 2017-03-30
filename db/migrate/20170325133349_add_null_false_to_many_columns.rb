class AddNullFalseToManyColumns < ActiveRecord::Migration[5.0]
  def change
    change_column :comments, :post_id, :integer, :null => false
    change_column :comments, :user_id, :integer, :null => false
    change_column :comments, :body, :text, :null => false
    change_column :likes, :post_id, :integer, :null => false
    change_column :likes, :user_id, :integer, :null => false
    change_column :posts, :user_id, :integer, :null => false
    change_column :posts, :body, :text, :null => false
    change_column :users, :name, :string, :null => false
    change_column :users, :email, :string, :null => false
  end
end
