require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { build(:comment) }

  let(:valid_params) { {user_id: User.first.id, body: "body" } }

  describe 'attributes' do
    it { is_expected.to respond_to(:body) }
    it { is_expected.to respond_to(:user) }
    it { is_expected.to respond_to(:post) }
  end

  describe 'validate presence' do
    it { is_expected.to validate_presence_of(:post_id) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:body) }
  end

  #app/models/application_record.rb
  describe 'scope: chronological_order' do
    let(:post) { create(:post) }
    let(:comment1) { post.comments.create!(user_id: User.first.id, body: "first comment") }
    let(:comment2) { post.comments.create!(user_id: User.first.id, body: "second comment") }

    it 'orders them chronologically' do
      # touch the first comment to change default order
      comment1.touch
      expect(post.reload.comments.chronological_order).to eq([comment1, comment2])
    end
  end
end
