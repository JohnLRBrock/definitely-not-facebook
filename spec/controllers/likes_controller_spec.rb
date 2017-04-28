# test spec for likes controller
require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { create(:user) }
  let(:my_post) { create(:post)}
  before do
    sign_in user
  end
  describe 'POST create' do
    it 'increments likes' do
      expect do
        post :create, params: { like: { post_id: my_post.id } }
      end.to change(Like, :count).by(1)
    end
    it 'redirects to root_url' do
      post :create, params: { like: { post_id: my_post.id } }
      expect(response).to redirect_to(root_url)
    end
  end
  describe 'DELETE destroy' do
    it 'decrements likes' do
      my_post.likes.create(user_id: user.id)
      expect do
        delete :destroy, params: { id: my_post.id }
      end.to change(Like, :count).by(-1)
    end
    it 'redirects to root_url' do
      delete :destroy, params: { id: my_post.id }
      expect(response).to redirect_to root_url
    end
  end
end
