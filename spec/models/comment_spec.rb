require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    User.delete_all
    Comment.delete_all
    User.create(email:'adam@example.com', password: 'foobar', password_confirmation: 'foobar')
    User.first.posts.build(body: "Hello World").save
    User.first.comments.build(post_id: Post.first.id).save
  end
  context "building comments without requisite attributes" do
    it "requires a post_id" do
      parentless = Comment.new(user_id: User.first.id,
                               body: "Hello World")
      expect(parentless.valid?).to be false
    end
    it "requires a user_id" do
     posterless = Comment.new(user_id: User.first.id,
                               body: "Hello World")
     expect(posterless.valid?).to be false
    end
    it "requires a body" do
      bodyless = Comment.new(user_id: User.first.id,
                               post_id: Post.first.id)
      expect(bodyless.valid?).to be false
    end
  end
end
