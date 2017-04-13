class FriendRequest < ApplicationRecord
  belongs_to :user
  validate :stop_friending_yourself
  validates :friend_id, :user_id, presence: true

  def stop_friending_yourself
    errors.add(:user_id, "can't friend themself") if user_id == friend_id
  end
end
