require 'spec_helper'

feature "sign up a user" do

	scenario 'sign up/sign out/sign in a new person' do
		visit articles_path
		click_link 'Sign Up'
		fill_in 'Email', with: 'test@email.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_on 'Sign Up'
		click_on 'Sign Out'
		visit articles_path
		click_link 'Sign In?'
		fill_in 'Email', with: 'test@email.com'
		fill_in 'Password', with: 'password'
		click_on 'Sign In?'
	end

	scenario 'unsuccessfully' do
		@user = create(:user)
		visit root_path
		save_and_open_page
		click_link 'Sign In?'
		fill_in 'Email', with: @user.email
		fill_in 'Password', with: 'something'
		click_button 'Sign in'
		expect(page).to have_content 'Invalid'
		expect(page).to_not have_content "Signed in as"
		#save_and_open_page
	end
end



