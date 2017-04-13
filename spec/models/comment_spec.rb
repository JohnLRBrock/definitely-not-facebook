require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    User.destroy_all
    Post.destroy_all
    Comment.destroy_all
    User.create(email:'adam@example.com', password: 'foobar', password_confirmation: 'foobar')
    User.first.posts.build(body: "Hello World").save
    User.first.comments.build(post_id: Post.first.id).save
  end

  let(:valid_params) { {user_id: User.first.id, body: "body" } }

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

  context "successfully creating comments" do
    it "creates a comment" do
      num = Comment.count
      expect(Post.first.comments.build(valid_params).save).to be true
      expect(Post.first.comments.build(valid_params).save).to be true
      expect(num + 2).to eq(Comment.count)
    end
  end

  context "scope: chronological_order" do
    it "orders them chronologically" do
      post = User.first.posts.create!(body: "hello world")
      comment1 = post.comments.create!(user_id: User.first.id, body: "first comment")
      comment2 = post.comments.create!(user_id: User.first.id, body: "second comment")
      #touch the first comment to change default order
      comment1.touch

      expect(post.reload.comments.chronological_order).to eq([comment1, comment2])
    end
  end
end
