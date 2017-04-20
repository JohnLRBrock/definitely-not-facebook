require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user)          { create(:user) }
  let(:new_post)      { create(:post) }
  let(:comment_attrs) { 
                        { body: 'body', post_id: new_post.id }
                      }

  before do
    #request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'POST #create' do
    it 'incremement number of posts by 1' do
      expect do
        post :create, params: { comment: comment_attrs }
      end.to change(Post, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success' do
      comment = create(:comment)
      delete :destroy, params: { comment: comment.id }
      expect(response).to have_http_status(:success)
    end
    it 'recrements the number of posts by 1' do
      comment = create(:comment)
      expect do
        post :destroy, params: { comment: comment.id }
      end.to change(Post, :count).by(-1)
    end
  end
end
