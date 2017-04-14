module FriendRequestsHelper
  def any_requests?(user)
    user.friend_requests.any?
  end
  def friend_requests?(user, friend)
    FriendRequest.exists?(user_id: user.id, friend_id: friend.id)
  end
  def destroy_friend_request(friend)
    request_hash = { friend_id: friend.id, user_id: current_user.id }
    while FriendRequest.exists? request_hash
      FriendRequest.find_by(request_hash).destroy
    end
    request_hash = { friend_id: current_user.id, user_id: friend.id }
    while FriendRequest.exists? request_hash
      FriendRequest.find_by(request_hash).destroy
    end
  end
end
