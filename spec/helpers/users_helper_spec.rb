# test spec for user helpers
require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  let(:user) { create(:user) }
  describe '#user_attribute' do
    it "returns nil if the attribute is blank" do
      expect(user_attribute(user, :age).empty?).to be true
    end
    it "html displaying a user's attribute if it isn't blank" do
      expect(user_attribute(user, :name)).to eq("<p><strong>Name:</strong> #{user.name}</p>")
    end
  end
end
