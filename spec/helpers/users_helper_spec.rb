require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end


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
