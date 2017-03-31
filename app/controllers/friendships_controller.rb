class FriendshipsController < ApplicationController
  def create
    user = current_user
    friend = User.find params[:friend_id]
    user.friends << friend
    friend.friends << user
    user.friend_requests.destroy friend
    friend.friend_requests.destroy user
    flash[:notice] = "You are now friends with #{friend.name}"
    redirect_to friend
  end

  def destroy
    user = current_user
    friend = User.find params[:friend_id]
    user.friends.destroy friend
    friend.friends.destroy user
    redirect_to friend
  end
end
