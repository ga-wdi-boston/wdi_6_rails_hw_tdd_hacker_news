require 'spec_helper'

feature 'User views all posts on front page' do
	scenario 'successfully (signed in)' do
		google = create(:google)
		twitter = create(:twitter)
		kiva = create(:kiva)

		user = create(:user)
		visit root_path
		sign_in_as(user)

		expect(page).to have_content("Signed in as #{user.email}")
		expect(page).to have_content('I can haz search?')
		expect(page).to have_content('Microfinance loans to the developing world')
		expect(page).to have_link('Twitter')
		expect(page).to have_link('Comments')
	end

end
