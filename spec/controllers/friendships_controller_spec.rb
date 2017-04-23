# friendships controller test spec
require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let(:user) { create(:user) }
  before do
    sign_in user
    @friend = create(:user)
  end

  describe 'PUT create' do
    it 'increments Friendships' do
      expect do
        put :create, params: { friend_id: @friend.id }
      end.to change(Friendship, :count).by(2)
    end

    context 'with no other friend requests' do
      it 'redirects to root_url' do
        put :create, params: { friend_id: @friend.id }
        expect(response).to redirect_to root_url
      end
    end

    context 'with other friend requests' do
      it 'redirects to friend_requests_url' do
        user.friend_requests.create(friend_id: create(:user).id)

        put :create, params: { friend_id: @friend.id }
        expect(response).to redirect_to friend_requests_url
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      user.friends << @friend
      @friend.friends << user
    end

    it 'decrements Friendships' do
      expect do
        delete :destroy, params: { friend_id: @friend.id }
      end.to change(Friendship, :count).by(-2)
    end

    it 'redirects_to friend' do
      delete :destroy, params: { friend_id: @friend.id }
      expect(response).to redirect_to @friend
    end
  end
end
