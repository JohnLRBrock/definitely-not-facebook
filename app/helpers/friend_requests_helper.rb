module FriendRequestsHelper
  def friend_requests?(user, friend)
    user.friend_requests.exists?(friend.id)
  end
  def any_requests?(user)
    user.friend_requests.any?
  end
end
