require 'rails_helper'

RSpec.describe FriendRequestsHelper, type: :helper do
  before(:all) do
    User.destroy_all
    Friendship.destroy_all
    FriendRequest.destroy_all

    @adam =  User.create!(email: 'adam@gmail.com',
                          password: 'foobar', password_confirmation: 'foobar')
    @eve =   User.create!(email: 'eve@gmail.com',
                          password: 'foobar', password_confirmation: 'foobar')
    @steve = User.create!(email: 'steve@gmail.com',
                          password: 'foobar', password_confirmation: 'foobar')

    @eve.friend_requests.create(friend_id: @adam.id)
  end

  describe '#any_requests?' do
    context 'user with friend requests' do
      it 'returns true' do
        expect(any_requests?(@eve)).to be true
      end
    end
    context 'user who has no requests but has sent requests' do
      it 'returns false' do
        expect(any_requests?(@adam)).to be false
      end
    end
    context 'user without friend requests' do
      it 'returns false' do
        expect(any_requests?(@steve)).to be false
      end
    end
  end

  describe '#friend_requests?' do
    context 'user with a request from another user' do
      it 'returns true' do
        expect(friend_requests?(@eve, @adam)).to be true
      end
    end
    context 'user with request to user but not from user' do
      it 'returns false' do
        expect(friend_requests?(@adam, @eve)).to be false
      end
    end
    context 'users with no requests' do
      it 'returns false' do
        expect(friend_requests?(@adam, @steve)).to be false
      end
    end
  end

  describe '#destroy_friend_request' do
    context 'friend request exists between current user and friend' do
      xit 'destroys all friend requests' do
      end
    end
    context 'no friend requests between current user and friend' do
      xit 'makes no changes in friend requests'
    end
  end
end
