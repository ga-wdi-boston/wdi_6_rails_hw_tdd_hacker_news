require 'spec_helper'

feature 'User views all posts on front page' do

	background do
		@post_1 = create(:post)
		@post_2 = create(:post)
		@post_3 = create(:post)

		@user = create(:user)
		sign_in_as(@user)
	end

	scenario 'successfully (signed in)' do
		expect(page).to have_content("Signed in as #{@user.email}")
		expect(page).to have_content(@post_3.description)
		expect(page).to have_content(@post_1.description)
		expect(page).to have_link(@post_2.title)
		expect(page).to have_link(@post_1.title)
	end

end
