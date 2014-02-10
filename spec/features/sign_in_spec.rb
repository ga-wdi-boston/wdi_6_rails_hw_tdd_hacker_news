require 'spec_helper'

feature 'Sign in' do
	scenario 'A visitor' do
		visit new_user_session_path
		fill_in 'Email', with: 'em@example.com'
		fill_in 'Password', with: 'password'
		click_on 'Sign in'

	end

end