require 'spec_helper'

feature 'visitor signs up ' do
	scenario 'a new account is created' do
		visit new_user_registration_path
		expect(page).to have_content 'Sign up'
	end
end