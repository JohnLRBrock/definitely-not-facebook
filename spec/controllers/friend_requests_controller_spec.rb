# test spec for friend request controllers

# implement a factory for creating friend requests
require 'rails_helper'

RSpec.describe FriendRequestsController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET index' do
    it 'renders index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'sets @friends' do
      # generate friend requests
      users = create_list(:user, 10)
      users.each { |requester| user.friend_requests.create(friend_id: requester.id) }

      # alter order
      10.times { user.friend_requests.sample.touch }
      friends = user.friend_requests.chronological_order.pluck(:friend_id).uniq

      get :index
      expect(assigns(:friends)).to eq(friends)
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
    it 'increments friend requests' do
      expect do
        post :create, params: { friend_id: create(:user) }
      end.to change(FriendRequest, :count).by(1)
    end

    it 'redirects to friend_url' do
      friend = create(:user)
      post :create, params: { friend_id: friend.id }
      expect(response).to redirect_to(friend)
    end

    it 'returns http success' do
      friend = create(:user)
      post :create, params: { friend_id: friend.id }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'DELETE destroy' do
    it 'decrements friend requests' do
      friend = create(:user)
      user.friend_requests.create(friend_id: friend.id)
      expect do
        delete :destroy, params: { friend_id: friend.id }
      end.to change(FriendRequest, :count).by(-1)
    end

    it 'redirects to friend' do
      friend = create(:user)
      delete :destroy, params: { friend_id: friend.id }
      expect(response).to redirect_to(friend)
    end
  end
end
