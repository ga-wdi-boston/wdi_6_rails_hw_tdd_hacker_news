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



		# visit root_path
		# click_on 'Submit a Link' # goes to 'posts/new'
		# expect(page).to have_content("Submit a Link")
		# fill_in 'Title', with: sample_title
		# fill_in 'Link', with: sample_link
		# fill_in 'Description', with: sample_desc
		# click_on 'Submit Link' # goes to 'posts'
		# expect(page).to have_link(sample_title)
		# expect(page).to have_link('Comments')
		# # it's not working to click on the Comments link...
		# click_link 'Comments'
		# expect(page).to have_content(sample_title)
	end

	scenario "Unsigned-in user tries to submit a comment" do
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
		expect(page).to have_link(sample_title)
		expect(page).to have_link('Comments')
		click_link 'Comments'
		expect(page).to have_content(sample_title)
		save_and_open_page
		# # starting on a post page with a submit comment form
		# fill_in :body, with: "Hi-ho Silver"
		# click_on 'Submit Comment' # goes to 'posts/1/comments'
		# expect(page).to have_content("Hi-ho Silver")
		# # save_and_open_page
	end

	# scenario "Signed-in user submits a comment" do
	# 	# starting on a post page with a submit comment form
	# 	fill_in 'Body', with: "Hi-ho Silver"
	# 	click_on 'Submit Comment' # goes to 'posts/1/comments'
	# 	expect(page).to have_content("Hi-ho Silver")
	# 	save_and_open_page
	# end
end
