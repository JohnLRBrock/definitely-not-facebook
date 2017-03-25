class AddProfileInformationtoUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :location, :string
    add_column :users, :occupation, :string
    add_column :users, :age, :integer
    add_column :users, :self_summary, :text
  end
end
