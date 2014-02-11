require 'spec_helper'

feature "Submit Link" do

	scenario "Un-signed-in user tries to submit a link" do
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
		fill_in 'Email', with: "tom@example.com"
		fill_in 'Password', with: "password"
		fill_in 'Password confirmation', with: "password"
		click_on 'Sign up'
		expect(page).to have_content("signed in as")

		sample_link = "http://example.com"
		sample_desc = "Description"

		visit root_path
		click_on 'Submit a Link' # goes to 'posts/new'
		expect(page).to have_content("Submit a Link")
		fill_in 'Link', with: sample_link
		fill_in 'Description', with: sample_desc
		click_on 'Submit Link'
		save_and_open_page
		expect(page).to have_content(sample_link)
		# save_and_open_page
	end

end
