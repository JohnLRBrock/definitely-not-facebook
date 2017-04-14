require 'rails_helper'

RSpec.describe FriendRequestsHelper, type: :helper do
  before(:all) do
    User.destroy_all
    Friendship.destroy_all
    FriendRequest.destroy_all

    User.create!(email: 'adam@gmail.com',
                password: 'foobar', password_confirmation: 'foobar')
    User.create!(email: 'eve@gmail.com',
                password: 'foobar', password_confirmation: 'foobar')
    User.create!(email: 'steve@gmail.com',
                password: 'foobar', password_confirmation: 'foobar')

    adam = User.find_by(email: 'eve@gmail.com')
    eve = User.find_by(email: 'adam@gmail.com')
    adam.friend_requests.create(friend_id: eve.id)
  end

  let(:adam)  { User.find_by email: 'adam@gmail.com' }
  let(:eve)   { User.find_by email: 'eve@gmail.com' }
  let(:steve) { User.find_by email: 'steve@gmail.com' }

  #helper.should_receive(:current_user).and_return('my return value').

  describe '#any_requests?' do
    context 'user with friend requests' do
      it 'returns true' do
        expect(any_requests?(eve)).to be true
      end
    end
    context 'user who has no requests but has sent requests' do
      it 'returns false' do
        expect(any_requests?(adam)).to be false
      end
    end
    context 'user without friend requests' do
      it 'returns false' do
        expect(any_requests?(steve)).to be false
      end
    end
  end

  describe '#friend_requests?' do
    context 'user with a request from another user' do
      it 'returns true' do
        expect(friend_requests?(eve, adam)).to be true
      end
    end
    context 'user with request to user but not from user' do
      it 'returns false' do
        expect(friend_requests?(adam, eve)).to be false
      end
    end
    context 'users with no requests' do
      it 'returns false' do
        expect(friend_requests?(adam, steve)).to be false
      end
    end
  end
end
