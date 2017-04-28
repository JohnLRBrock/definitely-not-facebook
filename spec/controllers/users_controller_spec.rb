# test spec for users controller
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user)      { create(:user) }
  let(:post_list) { create_list(:post, 12, user: user) }
  let(:posts)     { user.posts.chronological_order }


  before do
    sign_in user
  end

  describe 'GET index' do
    it 'renders a page with all users' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @users' do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe 'GET show' do
    it 'renders the users profile page' do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end

    it 'assigns @user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns @friends' do
      get :show, params: { id: user.id }
      expect(assigns(:friends)).to eq(user.friends.chronological_order)
    end

    it 'assigns @posts' do
      get :show, params: { id: user.id }
      expect(assigns(:posts)).to eq(posts)
    end

  end

  describe 'GET edit' do
    it 'renders the edit page' do
      get :edit, params: { id: user.id }
      expect(response).to render_template(:edit)
    end
  end
end
