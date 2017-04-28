#test specs for friendship helpers
require 'rails_helper'

RSpec.describe FriendshipsHelper, type: :helper do
  before(:all) do
    @user = create(:user)
    @friend = create(:user)
    @friendless = create(:user)
    @user.friends << @friend
    @friend.friends << @user
  end

  describe '#friends?' do
    it 'returns true if the two users are friends' do
      expect(friends?(@user, @friend)).to be true
      expect(friends?(@friend, @user)).to be true
    end
    it 'returns false if the users are not friends' do
      expect(friends?(@user, @friendless)).to be false
      expect(friends?(@friendless, @user)).to be false
    end
  end
end
