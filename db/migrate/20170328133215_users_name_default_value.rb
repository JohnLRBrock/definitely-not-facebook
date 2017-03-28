class UsersNameDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :name, :string, default: 'Anonymous'
  end
end
