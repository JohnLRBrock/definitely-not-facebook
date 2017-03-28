class Friend < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'friends'

  validates :user_id, :friend_id, presence: true
end
