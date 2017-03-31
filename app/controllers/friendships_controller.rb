class FriendshipsController < ApplicationController
  include FriendRequestsHelper
  def create
    user = current_user
    friend = User.find params[:friend_id]
    # create friendships
    user.friends << friend
    friend.friends << user
    # destroy friend requests
    request_hash = { friend_id: friend.id, user_id: user.id }
    while FriendRequest.exists? request_hash
      FriendRequest.find_by(request_hash).destroy
    end
    while FriendRequest.exists? request_hash
      FriendRequest.find_by(request_hash).destroy
    end
    flash[:notice] = "You are now friends with #{friend.name}"
    if any_requests?(current_user)
      redirect_to friend_requests_url
    else
      redirect_to root_url
    end
  end

  def destroy
    user = current_user
    friend = User.find params[:friend_id]
    user.friends.destroy friend
    friend.friends.destroy user
    redirect_to friend
  end
end
