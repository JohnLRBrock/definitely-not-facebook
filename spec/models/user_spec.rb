require 'rails_helper'

RSpec.describe User, type: :model do
  # reset database and populate it with adam and eve
  before(:all) do
    User.destroy_all
    User.create!(name: 'adam', email:'adam@example.com',
                           password: 'foobar', password_confirmation: 'foobar')
    User.create!(name: 'eve', email:'eve@example.com',
                           password: 'foobar', password_confirmation: 'foobar')
  end
  
  describe "attributes" do
    it "doesn't allow duplicate names or emails" do
      adam_clone = User.new(name: 'adam', email:'adam@example.com')
      expect(adam_clone.valid?).to be false
    end
    
    it "is case insensitive with name and emails" do
      capital_clone = User.new(name: 'AdAm', email:'AdAm@eXaMpLe.cOm')
      expect(capital_clone.save).to be false
    end
    
    it "requires the existence of name" do
      nameless = User.new(email: 'nameless@example.com')
      expect(nameless.valid?).to be false
    end
    
    it "requires the existence of email" do
      emailless = User.new(name: 'emailless')
      expect(emailless.valid?).to be false
    end
  end
end
