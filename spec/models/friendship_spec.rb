# spec for testing friendship relationships between users
require 'rails_helper'

RSpec.describe Friendship, type: :model do
  subject(:friend_request) { FriendRequest.new(user_id:   create(:user).id,
                                               friend_id: create(:user).id) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:friend_id) }
end
