require 'rails_helper'

RSpec.describe User, type: :model do
  # reset database and populate it with adam and eve
  before(:all) do
    User.destroy_all
    @adam = User.create!(name: 'adam', email:'adam@example.com',
                           password: 'foobar', password_confirmation: 'foobar')
    @eve = User.create!(name: 'eve', email:'eve@example.com',
                           password: 'foobar', password_confirmation: 'foobar')
  end
  
  describe "attributes" do
    it 'responds to #name' do
      expect(@adam).to respond_to(:name)
    end
    it 'responds to #email' do
      expect(@adam).to respond_to(:email)
    end
    it 'responds to #location' do
      expect(@adam).to respond_to(:location)
    end
    it 'responds to #occupation' do
      expect(@adam).to respond_to(:occupation)
    end
    it 'responds to #age' do
      expect(@adam).to respond_to(:age)
    end
    it 'responds to #self_summary' do
      expect(@adam).to respond_to(:self_summary)
    end

    it "doesn't allow duplicate names or emails" do
      adam_clone = User.new(name: 'adam', email:'adam@example.com',
                            password: 'foobar', password_confirmation: 'foobar')
      expect(adam_clone.save).to be false
    end
    
    it "is case insensitive with name and emails" do
      capital_clone = User.new(name: 'AdAm', email:'AdAm@eXaMpLe.cOm',
                               password: 'foobar', password_confirmation: 'foobar')
      expect(capital_clone.save).to be false
    end
    
    it "requires the existence of name" do
      skip 'TODO'
      nameless = User.new(email: 'nameless@example.com',
                          password: 'foobar', password_confirmation: 'foobar')
      expect(nameless.save).to be false
    end

    
    it "requires the existence of email" do
      emailless = User.new(name: 'emailless',
                           password: 'foobar', password_confirmation: 'foobar')
      expect(emailless.save).to be false
    end
  end
end
