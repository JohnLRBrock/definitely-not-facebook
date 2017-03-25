require 'rails_helper'
=begin
RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name1",
        :email => "Email1"
      ),
      User.create!(
        :name => "Name2",
        :email => "Email2"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
=end