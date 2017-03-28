require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do
    User.delete_all
    User.create(email:'adam@example.com',  password: 'foobar', password_confirmation: 'foobar')
    User.create(email:'eve@example.com',   password: 'foobar', password_confirmation: 'foobar')
    User.create(email:'steve@example.com', password: 'foobar', password_confirmation: 'foobar')
  end

  context '#feed_posts' do
    it 'returns all the posts of the user and their friends' do
      skip 'Implement friends first'
    end
  end
=begin
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
=end
end
