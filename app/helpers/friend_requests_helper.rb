# helper methods reguarding friend requests
module FriendRequestsHelper
  # does the user have any friend requests?
  def any_requests?(user)
    user.friend_requests.any?
  end

  # has user sent friend a friend request?
  def friend_requests?(user, friend)
    FriendRequest.exists?(user_id: user.id, friend_id: friend.id)
  end
  
  # destroys all friend requests between two users
  def destroy_friend_request(friend)
    proc = Proc.new { |params| FriendRequest.find_by(params).destroy while FriendRequest.exists? params }
    proc.call(friend_id: friend.id, user_id: current_user.id)
    proc.call(friend_id: current_user.id, user_id: friend.id)
  end
end
