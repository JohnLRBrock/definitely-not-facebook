require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the FriendshipsHelper. For example:
#
# describe FriendshipsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe FriendshipsHelper, type: :helper do
  before(:all) do
    User.delete_all
    User.create(email: 'adam@gmail.com',
                password: 'foobar', password_confirmation: 'foobar')
    User.create(email: 'eve@gmail.com',
                password: 'foobar', password_confirmation: 'foobar')
    User.create(email: 'steve@gmail.com',
                password: 'foobar', password_confirmation: 'foobar')

    Friendship.delete_all
    User.first.friends << User.find_by(email: 'eve@gmail.com')
    User.find_by(email: 'eve@gmail.com').friends << User.first
  end
  let(:adam)  { User.find_by email: 'adam@gmail.com' }
  let(:eve)   { User.find_by email: 'eve@gmail.com' }
  let(:steve) { User.find_by email: 'steve@gmail.com' }

  describe '#friends?' do
    it 'returns true if the two users are friends' do
      expect(friends?(adam, eve)).to be true
      expect(friends?(eve, adam)).to be true
    end
    it 'returns false if the users are not friends' do
      expect(friends?(adam, steve)).to be false
      expect(friends?(steve, adam)).to be false
    end
  end
end
