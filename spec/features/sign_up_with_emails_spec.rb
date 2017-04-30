require 'rails_helper'

RSpec.feature "SignUpWithEmails", type: :feature do
  describe "the signin process", :type => :feature do
    before :each do
      create(:user)
    end

    it "signs me in" do
      visit '/users/sign_in'
      fill_in 'Email', with: User.first.email
      fill_in 'Password', with: 'foobar'
      click_button 'Log in'
      expect(page).to have_content 'Anonymous Signed in successfully'
    end
  end
end
