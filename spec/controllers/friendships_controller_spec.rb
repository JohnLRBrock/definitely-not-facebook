require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  before(:all) do
    User.delete_all
    User.create(email:'adam@example.com',  password: 'foobar', password_confirmation: 'foobar')
    User.create(email:'eve@example.com',   password: 'foobar', password_confirmation: 'foobar')
    User.create(email:'steve@example.com', password: 'foobar', password_confirmation: 'foobar')
  end
  let(:adam) { User.find_by email: 'adam@example.com' }
  let(:eve)  { User.find_by email: 'eve@example.com' }
  let(:steve){ User.find_by email: 'steve@example.com' }
end
