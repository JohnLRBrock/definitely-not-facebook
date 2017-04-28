# test specs for friend request helpers
require 'rails_helper'

RSpec.describe FriendRequestsHelper, type: :helper do

  before(:all) do
    @user = create(:user)
    @friend = create(:user)
    @friendless = create(:user)
    @friend.friend_requests.create(friend_id: @user.id)
  end

  describe '#any_requests?' do
    context 'user with friend requests' do
      it 'returns true' do
        expect(any_requests?(@friend)).to be true
      end
    end
    context 'user who has no requests but has sent requests' do
      it 'returns false' do
        expect(any_requests?(@user)).to be false
      end
    end
    context 'user without friend requests' do
      it 'returns false' do
        expect(any_requests?(@friendless)).to be false
      end
    end
  end

  describe '#friend_requests?' do
    context 'user with a request from another user' do
      it 'returns true' do
        expect(friend_requests?(@friend, @user)).to be true
      end
    end
    context 'user with request to user but not from user' do
      it 'returns false' do
        expect(friend_requests?(@user, @friend)).to be false
      end
    end
    context 'users with no requests' do
      it 'returns false' do
        expect(friend_requests?(@user, @friendless)).to be false
      end
    end
  end
end
