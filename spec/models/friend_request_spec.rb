# test specs for friend request model
require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  subject(:friend_request) { FriendRequest.new(user_id:   create(:user).id,
                                               friend_id: create(:user).id) }
  before(:all) do
    2.times { create(:user) }
  end
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:friend_id) }

  context 'no friend_id' do
    it 'is not valid' do
      friendless = FriendRequest.new(user_id: User.first.id)
      expect(friendless.save).to be false
    end
  end

  context 'no user_id' do
    it 'is not valid' do
      userless = FriendRequest.new(friend_id: User.last.id)
      expect(userless.save).to be false
    end
  end

  context 'valid params' do
    it 'creates a new friend request' do
      request_count = FriendRequest.count
      valid_request = FriendRequest.new(friend_id: User.first.id,
                                       user_id: User.last.id)
      expect(valid_request.save!).to be true
      expect(request_count + 1).to eq(FriendRequest.count)
    end
  end

  context 'attempt to friend yourself' do
    it 'fails' do
      reflexive_friend_request = FriendRequest.new(friend_id: User.first.id, 
                                                   user_id: User.first.id)
      expect(reflexive_friend_request.valid?).to be false
    end
  end

  context 'friend request already exists' do
    context 'user has friend request' do
      it 'fails' do
        user = create(:user)
        friend = create(:user)
        user.friend_requests.create(friend_id: friend.id)
        second_friend_request = FriendRequest.new(friend_id: friend.id, user_id: user.id)
        expect(second_friend_request.valid?).to be false
      end
    end
    context 'friend has friend request' do
      it 'fails' do
        user = create(:user)
        friend = create(:user)
        friend.friend_requests.create(friend_id: user.id)
        second_friend_request = FriendRequest.new(friend_id: user.id, user_id: friend.id)
        expect(second_friend_request.valid?).to be false
      end
    end
  end

  context 'friendship already exists' do
    it 'fails' do
      user = create(:user)
      friend = create(:user)
      user.friends << friend
      friend.friends << user
      already_friends = FriendRequest.new(friend_id: user.id, user_id: friend.id)
      expect(already_friends.valid?).to be false
    end
  end
end
