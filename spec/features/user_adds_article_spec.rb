require 'spec_helper'

feature 'Logged in user can add article' do
	background do
		user = create(:user)
		sign_in_as(user)
	end

	scenario 'successfully' do
		visit root_path
		click_link 'Submit'
		fill_in 'Title', with: 'First article'
		fill_in 'Url', with: 'http://richardlynch.blogspot.com/'
		click_button 'Submit'
		expect(page).to have_content 'First article'
	end

	scenario 'unsuccessfully if not logged in' do
		click_link 'Sign out'
		visit root_path
		expect(page).to_not have_link 'Sumbit'

	end

end