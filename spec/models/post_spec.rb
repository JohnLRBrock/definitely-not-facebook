require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    User.delete_all
    User.find_or_create_by(name: 'adam', email:'adam@example.com')
  end
  context 'building a post without requisite attributes' do
    it 'needs a user' do
      no_user = Comment.new(body: 'Hello world')
      expect(no_user.valid?).to be false
    end
    it 'needs a body' do
      no_body = Comment.new(user_id: User.first.id)
      expect(no_body.valid?).to be false
    end
  end
end
