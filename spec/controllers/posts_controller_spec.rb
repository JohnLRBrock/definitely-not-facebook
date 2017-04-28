require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  before do
    sign_in user
    @friends = create_list(:user, 10)
    @friends.each { |friend| user.friends << friend }
    @friends.each { |friend| friend.friends << user }
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'sets @post' do
      get :index
      expect(assigns(:post).id).to eq(user.posts.build.id)
    end
    it 'sets @posts' do
      @posts = [Post.create(user_id: user.id, body: 'text')]
      @friends.each {|friend| @posts << Post.create(user_id: friend.id, body: 'text') }
      get 'index'
      expect(assigns(:posts).count).to eq(@posts.count)
    end
  end
  describe 'POST create' do
    let(:post_params) { 
                        { body: 'text' }
                      }
    it 'creates a new post' do
      expect do
        post :create, params: { post: post_params }
      end.to change(Post, :count).by(1)
    end
    it 'redirects to the new post' do
      post :create, params: { post: post_params }
      expect(response).to redirect_to(root_path)
    end
    it 'returns http redirect' do
      post :create, params: { post: post_params }
      expect(response).to have_http_status(:redirect)
    end
  end
end
