require 'spec_helper'

feature 'User signs out' do
	background do
		@user = create(:user)
		sign_in_as(@user)
	end

	scenario 'successfully' do
		click_link 'Sign out'
		expect(page).to have_link 'Sign in'
		expect(page).to_not have_content "Signed in as #{@user.email}"
	end


end