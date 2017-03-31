module FriendRequestsHelper
  def friend_requests?(user, friend)
    FriendRequest.exists?(user_id: user.id, friend_id: friend.id)
  end
  def any_requests?(user)
    user.friend_requests.any?
  end
end
