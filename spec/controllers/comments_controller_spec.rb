# test spec for comments controller
require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user)          { create(:user) }
  let(:new_post)      { create(:post) }
  let(:comment_attrs) { 
                        { body: 'body', post_id: new_post.id }
                      }

  describe 'POST #create' do
    before { sign_in user }
    it 'incremement number of posts by 1' do
      expect do
        post :create, params: { comment: comment_attrs }
      end.to change(Post, :count).by(1)
    end

    it 'redirects to root_url' do
      post :create, params: { comment: comment_attrs }
      expect(response).to redirect_to root_url
    end
  end

  describe 'DELETE #destroy' do
    let(:comment) { create(:comment) }
    before { sign_in comment.user }

    it 'decrements the number of posts by 1' do
      expect do
        post :destroy, params: { id: comment.id }
      end.to change(Comment, :count).by(-1)
    end

    it 'redirects to root_url' do
      delete :destroy, params: { id: comment.id }
      expect(response).to redirect_to root_url
    end
  end
end
