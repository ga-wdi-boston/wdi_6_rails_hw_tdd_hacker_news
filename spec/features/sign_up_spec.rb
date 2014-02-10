require 'spec_helper'

feature 'Sign up' do
	scenario 'a visitor' do
		visit new_user_registration_path
		fill_in 'Email', with: 'em@example.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_on 'Sign up'
	end
end