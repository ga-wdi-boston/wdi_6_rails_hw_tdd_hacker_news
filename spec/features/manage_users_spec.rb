require 'spec_helper'

feature "Manage Users" do

	scenario "Register a new user" do
		visit new_user_registration_path
  	fill_in 'Email', with: "matt@aol.com"
  	fill_in 'Password', with: "12341234"
 		fill_in 'Password confirmation', with: "12341234"
    click_on 'Sign up'
    expect(page).to have_content('Hacker News')
    # save_and_open_page
   end

  scenario "Sign in as an existing user" do
		visit new_user_registration_path
	  fill_in 'Email', with: "matt@aol.com"
  	fill_in 'Password', with: "12341234"
 		fill_in 'Password confirmation', with: "12341234"
		click_on 'Sign up'
		click_on 'Sign out'
	  visit new_user_session_path
	  fill_in 'Email', with: 'matt@aol.com'
	  fill_in "Password", with: "12341234"
	  click_on "Sign in"
	  expect(page).to have_content('Hacker News')
	  # save_and_open_page
	end

end


