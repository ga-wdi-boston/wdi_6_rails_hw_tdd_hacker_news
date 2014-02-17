require 'spec_helper'

feature 'A user should be able to create a post' do
	background do
		@user = create(:user)
	end
	scenario 'successfully' do
		sign_in_as(@user)
		click_on 'Submit post'
		fill_in 'Description', with: 'My newest post'
		fill_in 'Link', with: 'http://www.hackernews.com'
		click_on 'Create Post'

		expect(page).to have_content('My newest post')
	end
end
