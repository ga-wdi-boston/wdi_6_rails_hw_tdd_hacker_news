require 'spec_helper'

feature 'Visitor tries to submit a new comment' do


	background do
		@post = create(:post)
		@comment_1 = create(:comment, post: @post)
		@comment_2 = create(:comment, post: @post)
	end

	scenario "unsuccessfully (because they aren't signed in)" do

		visit root_path

		# click on a post
		within("article.post_#{@post.id}") do
			click_link 'Comments'
		end

		# write a new comment
		fill_in 'Body', with: 'sample comment'
		click_button 'Submit Comment'

		# expect to see error and sign in page
		expect(page).to have_content("You need to sign in or sign up before continuing.")
		expect(page).to have_content("Sign in")
		expect(page).to have_content("Sign up")

	end

end
