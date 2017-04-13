module FriendRequestsHelper
  def friend_requests?(user, friend)
    FriendRequest.exists?(user_id: user.id, friend_id: friend.id)
  end
  def any_requests?(user)
    user.friend_requests.any?
  end
  def destroy_friend_request(user, friend)
    request_hash = { friend_id: friend.id, user_id: user.id }
      while FriendRequest.exists? request_hash
        FriendRequest.find_by(request_hash).destroy
      end
      while FriendRequest.exists? request_hash
        FriendRequest.find_by(request_hash).destroy
      end
  end
end
