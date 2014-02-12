require 'spec_helper'

feature 'Visitor tries to submit a new post' do
	scenario "unsuccessfully (because they aren't signed in)" do
		visit root_path
		click_link 'Submit'

		expect(page).to have_content("You must be signed in to submit a link.")
		expect(page).to have_content("Sign in")
		expect(page).to have_content("Sign up")
	end

end
