# spec for testing users
require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = create(:user)
  end

  describe 'attributes' do
    it 'responds to #name' do
      expect(@user).to respond_to(:name)
    end
    it 'responds to #email' do
      expect(@user).to respond_to(:email)
    end
    it 'responds to #location' do
      expect(@user).to respond_to(:location)
    end
    it 'responds to #occupation' do
      expect(@user).to respond_to(:occupation)
    end
    it 'responds to #age' do
      expect(@user).to respond_to(:age)
    end
    it 'responds to #self_summary' do
      expect(@user).to respond_to(:self_summary)
    end

=begin
    it "doesn't allow duplicate emails" do
      copy = User.new(name: 'adam', email: 'adam@example.com',
                      password: 'foobar', password_confirmation: 'foobar')
      expect(copy.save).to be false
    end

    it 'is case insensitive with emails' do
      capital = User.new(name: 'AdAm', email: 'AdAm@eXaMpLe.cOm',
                         password: 'foobar', password_confirmation: 'foobar')
      expect(capital.save).to be false
    end
=end

    it 'requires the existence of name' do
      skip 'TODO'
      nameless = User.new(email: 'nameless@example.com',
                          password: 'foobar', password_confirmation: 'foobar')
      expect(nameless.save).to be false
    end

    it 'requires the existence of email' do
      emailless = User.new(name: 'emailless',
                           password: 'foobar', password_confirmation: 'foobar')
      expect(emailless.save).to be false
    end
  end
end
