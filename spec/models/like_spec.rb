require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    create(:post)
  end
  context 'Building likes without requisite paramaters' do
    it 'requires a user_id' do
      user_less = Like.new(post_id: Post.first.id)
      expect(user_less.valid?).to be false
    end
    it 'requires a post_id' do
      post_less = Like.new(user_id: User.first.id)
      expect(post_less.valid?).to be false
    end
  end
end
