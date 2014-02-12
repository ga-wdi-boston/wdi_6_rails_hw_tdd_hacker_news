require 'spec_helper'

feature 'User signs out' do
	scenario 'successfully' do
		user = create(:user) # goes to factory and creates user
		sign_in_as(user)
		click_link 'Sign out'
		expect(page).to have_content('Sign in')
	end
end
