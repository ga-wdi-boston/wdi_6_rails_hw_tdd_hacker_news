require 'spec_helper'

feature 'User downvotes an article' do

	background do
		user = create(:user)
		sign_in_as(user)
		@article = create(:article, user: user)
	end

	scenario 'successfully' do
		visit root_path
		within('.article') do
			find('.glyphicon-chevron-up').click
		end
		expect(page).to have_content '1 point'
		within('.article') do
			find('.glyphicon-chevron-down').click
		end
		expect(page).to have_content '-1 points'
	end


end