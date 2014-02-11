require 'spec_helper'

feature 'Visior signs up' do
	background do
		visit root_path
		click_link 'Sign in'
		click_link 'Sign up'
	end

	scenario 'successfully' do
		fill_in 'Email', with: 'email@example.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_button 'Sign up'
		expect(page).to have_link 'Sign out'
		expect(page).to have_content 'Signed in as email@example.com'

	end
end