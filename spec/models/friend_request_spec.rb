require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  before(:all) do
    User.destroy_all
    FriendRequest.destroy_all
    User.create!(name: 'adam', email:'adam@example.com',
                 password: 'foobar', password_confirmation: 'foobar')
    User.create!(name: 'eve', email:'eve@example.com',
                 password: 'foobar',password_confirmation: 'foobar')
  end
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
      expect(reflexive_friend_request.save).to be false
    end
  end

  context 'friend request already exists' do
    it 'fails to save' do
      skip "create tests to make sure that the friend helpers are working"
    end
  end

  context 'friendship already exists' do
    it 'fails to save' do
      skip "create tests to make sure that the friend helpers are working"
    end
  end
end
