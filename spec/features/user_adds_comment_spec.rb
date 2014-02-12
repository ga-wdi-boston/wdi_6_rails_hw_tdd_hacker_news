require 'spec_helper'

feature 'Logged in user can add a comment' do
	background do
		user = create(:user)
		sign_in_as(user)
		@article = create(:article)
	end

	scenario 'successfully' do
		visit root_path
		click_link 'comments'
		fill_in 'Comment', with: 'Adding new comment'
		click_button 'Add comment'
		expect(page).to have_content 'Adding new comment'
	end

end