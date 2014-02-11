require 'spec_helper'

feature "Submit Comment" do

	background do
		visit new_user_registration_path # 'users/sign_up'
		expect(page).to have_content("Sign up")
		fill_in 'Email', with: "anna@example.com"
		fill_in 'Password', with: "password"
		fill_in 'Password confirmation', with: "password"
		click_on 'Sign up'
		expect(page).to have_content("signed in as")

		sample_link = "http://thecakeisalie.com"
		sample_desc = "no it's not"

		visit root_path
		click_on 'Submit a Link' # goes to 'posts/new'
		expect(page).to have_content("Submit a Link")
		fill_in 'Link', with: sample_link
		fill_in 'Description', with: sample_desc
		click_on 'Submit Link' # goes to 'posts'
		expect(page).to have_content(sample_link)
	end

	scenario "Unsigned-in user tries to submit a comment" do
		visit root_path
		click_on 'Comments'
		# expect(page).to have_content()
	end
end
