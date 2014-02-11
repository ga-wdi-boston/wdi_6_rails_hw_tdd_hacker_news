require 'spec_helper'

feature "Manage Users" do

	scenario "Register a new user" do

		visit root_path
		click_on 'Sign up'
		visit new_user_registration_path # 'users/sign_up'
		expect(page).to have_content("Sign up")
		fill_in 'Email', with: "tom@example.com"
		fill_in 'Password', with: "password"
		fill_in 'Password confirmation', with: "password"
		click_on 'Sign up'
		expect(page).to have_content("Hacker News")

	end

	scenario "Sign in as an existing user" do

		# how do i put this in background? do i need to make "manage users" two separate features, and then just one has a background block?
		visit new_user_registration_path # 'users/sign_up'
		expect(page).to have_content("Sign up")
		fill_in 'Email', with: "tom@example.com"
		fill_in 'Password', with: "password"
		fill_in 'Password confirmation', with: "password"
		click_on 'Sign up'
		expect(page).to have_content("signed in as")
		click_on 'Sign out'

		visit root_path
		click_on 'Sign in'
		visit new_user_session_path # 'users/sign_in'
		expect(page).to have_content("Sign in")
		fill_in 'Email', with: "tom@example.com"
		fill_in 'Password', with: "password"
		click_on 'Sign in'
		expect(page).to have_content("signed in as")
	end

end
