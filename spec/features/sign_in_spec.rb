require 'spec_helper'

feature 'User signs in' do
	scenario 'successfully' do
		user = create(:user)
		sign_in_as(user)

		expect(page).to have_link 'Sign out'
		expect(page).to have_content "Signed in as #{user.email}"
	end

end