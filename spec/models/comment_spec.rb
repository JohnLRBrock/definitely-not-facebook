require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @post     = create(:post)
    @comment1 = @post.comments.create!(user_id: User.first.id, body: "first comment")
    @comment2 = @post.comments.create!(user_id: User.first.id, body: "second comment")
  end

  let(:valid_params) { {user_id: User.first.id, body: "body" } }

  describe 'attributes' do
    it 'responds to #body' do
      expect(@comment1).to respond_to(:body)
    end
    it 'responds to #user' do
      expect(@comment1).to respond_to(:user)
    end
    it 'responds to #post' do
      expect(@comment1).to respond_to(:post)
    end
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

  context "successfully creating a comment" do
    it "creates a comment" do
      num_comments_before = Comment.count
      expect(Post.first.comments.build(valid_params).save).to be true
      expect(num_comments_before + 1).to eq(Comment.count)
    end
  end

  context "scope: chronological_order" do
    it "orders them chronologically" do
      # touch the first comment to change default order
      @comment1.touch
      expect(@post.reload.comments.chronological_order).to eq([@comment1, @comment2])
    end
  end
end
