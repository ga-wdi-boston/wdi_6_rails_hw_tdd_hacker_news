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

	# scenario 'unsuccessfully if body blank' do
	# 	save_and_open_page
	# 	fill_in 'Comment', with: ''
	# 	click_button 'Add comment'
	# 	expect(page).to have_content "can't be blank"
	# end

	scenario 'unsuccessfully if not logged in' do
		click_link 'Sign out'
		click_link 'comments'
		fill_in 'Comment', with: 'Adding new comment'
		click_button 'Add comment'
		expect(page).to have_content 'Please sign in or sign up!'
	end


end