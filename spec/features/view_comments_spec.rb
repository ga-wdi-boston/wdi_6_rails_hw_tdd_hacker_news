require 'spec_helper'

feature "View Comments" do

	background do
		visit new_user_registration_path # 'users/sign_up'
		expect(page).to have_content("Sign up")
		fill_in 'Email', with: "anna@example.com"
		fill_in 'Password', with: "password"
		fill_in 'Password confirmation', with: "password"
		click_on 'Sign up'
		expect(page).to have_content("signed in as")

		sample_title = "Cake or Death?"
		sample_link = "http://thecakeisalie.com"
		sample_desc = "no it's not"

		visit root_path
		click_on 'Submit a Link' # goes to 'posts/new'
		expect(page).to have_content("Submit a Link")
		fill_in 'Title', with: sample_title
		fill_in 'Link', with: sample_link
		fill_in 'Description', with: sample_desc
		click_on 'Submit Link' # goes to 'posts'
		expect(page).to have_content(sample_link)

		sample_comment = "yes it is"

		# have the user add a comment
	end

	# scenario "Unsigned-in user tries to view comments" do
	# 	visit root_path
	# 	expect(page).to have_content(sample_title)
	# 	click_on 'Comments' # goes to 'posts/1/comments'
	# 	expect(page).to have_content(sample_title)
	# 	expect(page).to have_content(sample_comment)
	# 	# not finished yet
	# end

end
