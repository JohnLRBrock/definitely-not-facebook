require 'rails_helper'

RSpec.describe Friend, type: :model do
  before(:all) do
    User.delete_all
    User.create(email:'adam@example.com', password: 'foobar', password_confirmation: 'foobar')
    User.create(email:'eve@example.com',  password: 'foobar', password_confirmation: 'foobar')
  end
  it 'requires a user_id' do
    no_id = Friend.new(friend_id: User.first.id)
    expect(no_id.valid?).to be false
  end

  it 'requires a friend_id' do
    no_friend = Friend.new(user_id: User.first.id)
    expect(no_friend.valid?).to be false
  end
end
