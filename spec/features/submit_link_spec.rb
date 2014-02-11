require 'spec_helper'

feature "Submit Link" do

	scenario "Unregistered user tries to submit a link" do

		visit root_path
		click_on 'Submit a Link' # goes to ''
		expect(page).to have_content("You must sign in to submit a link.")
		expect(page).to have_content("Sign up")
		expect(page).to have_content("Sign in")
	end

	# scenario "Registered user tries to submit a link" do

	# 	# how do i put this in background? do i need to make "manage users" two separate features, and then just one has a background block?
	# 	visit new_user_registration_path # 'users/sign_up'
	# 	expect(page).to have_content("Sign up")
	# 	fill_in 'Email', with: "tom@example.com"
	# 	fill_in 'Password', with: "password"
	# 	fill_in 'Password confirmation', with: "password"
	# 	click_on 'Sign up'
	# 	expect(page).to have_content("signed in as")
	# 	click_on 'Sign out'

	# 	visit root_path
	# 	click_on 'Sign in'
	# 	visit new_user_session_path # 'users/sign_in'
	# 	expect(page).to have_content("Sign in")
	# 	fill_in 'Email', with: "tom@example.com"
	# 	fill_in 'Password', with: "password"
	# 	click_on 'Sign in'
	# 	expect(page).to have_content("signed in as")
	# end

end
