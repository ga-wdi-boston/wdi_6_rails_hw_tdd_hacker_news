require 'spec_helper'

feature "Submit Link" do

	scenario "Unsigned-in user tries to submit a link" do
		visit root_path
		click_on 'Submit a Link' # goes to 'posts/new'
		expect(page).to have_content("You must sign in to submit a link.")
		expect(page).to have_content("Sign up")
		expect(page).to have_content("Sign in")
	end

	scenario "Signed in user tries to submit a link" do

		# how do i put this in background? do i need to make "manage users" two separate features, and then just one has a background block?
		visit new_user_registration_path # 'users/sign_up'
		expect(page).to have_content("Sign up")
		fill_in 'Email', with: "anna@example.com"
		fill_in 'Password', with: "password"
		fill_in 'Password confirmation', with: "password"
		click_on 'Sign up'
		expect(page).to have_content("signed in as")

		sample_title = "Rawr"
		sample_link = "http://whoo#{rand(1..100).to_s}.com"
		sample_desc = "yay!"

		visit root_path
		click_on 'Submit a Link' # goes to 'posts/new'
		expect(page).to have_content("Submit a Link")
		fill_in 'Title', with: sample_title
		fill_in 'Link', with: sample_link
		fill_in 'Description', with: sample_desc
		click_on 'Submit Link' # goes to 'posts'
		expect(page).to have_content(sample_title)
		expect(page).to have_content(sample_desc)
	end

end
