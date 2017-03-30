require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
  before(:all) do
    User.delete_all
    Post.delete_all
    @adam  = User.create(email:'adam@example.com',
                         password: 'foobar', password_confirmation: 'foobar')
    @eve   = User.create(email:'eve@example.com',
                         password: 'foobar', password_confirmation: 'foobar')
    @steve = User.create(email:'steve@example.com',
                         password: 'foobar', password_confirmation: 'foobar')
    @adam.friends << @eve
    @eve.friends  << @steve
    @adam.posts.create(body: "Adam's first post")
    @adam.posts.create(body: "Adam's second post")
    @eve.posts.create(body: "Eve's first post")
    @eve.posts.create(body: "Eve's first post")
    @steve.posts.create(body: "Steve's first post")
    @steve.posts.create(body: "Steve's second post")
  end
=begin
  let(:adam) { User.find_by email:('adam@example.com') }
  let(:eve)  { User.find_by email:('eve@example.com') }
  let(:steve){ User.find_by email:('steve@example.com') }
  context '#feed_posts' do
    it 'returns all the posts of the user and their friends' do
      sign_in @adam
      expect(feed_posts.count).to eq 4
    end
  end
=end
end