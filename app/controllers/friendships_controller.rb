class FriendshipsController < ApplicationController
  include FriendRequestsHelper
  def create
    friend = User.find params[:friend_id]
    friend_user(friend)
    flash[:notice] = "You are now friends with #{friend.name}"
    if any_requests?(current_user)
      redirect_to friend_requests_url
    else
      redirect_to root_url
    end
  end

  def destroy
    friend = User.find params[:friend_id]
    unfriend_user(friend)
    redirect_to friend
  end

  private
    def friend_user(friend)
      current_user.friends << friend
      friend.friends << current_user
      destroy_friend_request(friend)
    end

    def unfriend_user(friend)
      current_user.friends.destroy friend
      friend.friends.destroy current_user
    end
end
