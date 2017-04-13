class FriendRequest < ApplicationRecord
  belongs_to :user
  validate :stop_friending_yourself
  validates :friend_id, :user_id, presence: true

  def stop_friending_yourself
    errors.add(:user_id, "can't friend themself") if user_id == friend_id
  end

  def duplicate_friend_request
    if FriendRequest.find_by(user_id: user_id, friend_id: friend_id) || FriendRequest.find_by(user_id: friend_id, friend_id: user_id)
      errors.add(:friend_id, 'request already exists')
    end
  end

  def already_friends
    if Friend.find_by(user_id: user_id, friend_id: friend_id) || Friend.find_by(user_id: friend_id, friend_id: user_id)
      errors_add(:user_id, 'is already friends with you.')
    end
  end
end
