class FriendRequestsController < ApplicationController
  def index
    @requests = current_user.friend_requests.all
  end

  def create
    user = current_user
    friend = User.find params[:friend_id]
    user.friend_requests << friend
    friend.friend_requests << user
    flash[:notice] = "Friend request has been sent to #{friend.name}"
    redirect_to friend
  end

  def destroy
    user = current_user
    friend = User.find params[:friend_id]
    user.friend_requests.destroy friend
    friend.friend_requests.destroy user
    redirect_to friend
  end
end