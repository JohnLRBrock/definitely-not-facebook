require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:all) do
    User.destroy_all
    FriendRequest.destroy_all
    User.create!(name: 'adam', email:'adam@example.com',
                 password: 'foobar', password_confirmation: 'foobar')
    User.create!(name: 'eve', email:'eve@example.com',
                 password: 'foobar',password_confirmation: 'foobar')
  end
end
