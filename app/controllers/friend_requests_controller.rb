class FriendRequestsController < ApplicationController
  def index
    @friend = current_user.friend_requests.pluck(:friend_id).uniq
  end

  def create
    user = current_user
    friend = User.find params[:friend_id]
    friend.friend_requests.create(friend_id: user.id)
    flash[:notice] = "Friend request has been sent to #{friend.name}"
    redirect_to friend
  end

  def destroy
    user = current_user
    friend = User.find params[:friend_id]
    request_hash = { friend_id: friend.id, user_id: user.id }
    while FriendRequest.exists? request_hash
      FriendRequest.find_by(request_hash).destroy
    end
    while FriendRequest.exists? request_hash
      FriendRequest.find_by(request_hash).destroy
    end
    redirect_to friend
  end
end