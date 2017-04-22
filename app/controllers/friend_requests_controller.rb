# controller for handling friend requests
class FriendRequestsController < ApplicationController
  include FriendRequestsHelper
  def index
    @friends = current_user.friend_requests.chronological_order.pluck(:friend_id).uniq
  end

  def create
    friend = User.find params[:friend_id]
    friend.friend_requests.create(friend_id: current_user.id)
    flash[:notice] = "Friend request has been sent to #{friend.name}"
    redirect_to friend
  end

  def destroy
    friend = User.find params[:friend_id]
    request_hash = { friend_id: friend.id, user_id: current_user.id }
    destroy_friend_request(friend)
    redirect_to friend
  end
end
