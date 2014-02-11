require 'spec_helper'

feature "Manage Users" do

	scenario "Register a new user" do

		visit root_path
		visit new_user_registration_path # 'users/sign_up'
		expect(page).to have_content("Sign up")
		fill_in 'Email', with: "tom@example.com"
		fill_in 'Password', with: "password"
		fill_in 'Password confirmation', with: "password"
		click_on 'Sign up'
		expect(page).to have_content("Hacker News")
	end

	scenario "Registered user signing in" do

	end

end
