require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  before(:all) do
    User.delete_all
    User.create(email: 'adam@gmail.com',
                password: 'foobar', password_confirmation: 'foobar')
  end
  describe '#user_attribute' do
    it "returns nil if the attribute is blank" do
      expect(user_attribute(User.first, :age).empty?).to be true
    end
    it "html displaying a user's attribute if it isn't blank" do
      expect(user_attribute(User.first, :name)).to eq("<p><strong>Name:</strong> #{User.first.name}</p>")
    end
  end
end
