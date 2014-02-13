require 'spec_helper'

feature 'User downvotes an article' do

	background do
		user = create(:user)
		sign_in_as(user)
		@article = create(:article, user: user)
	end

	scenario 'successfully' do
		visit root_path
		page.find('.glyphicon-chevron-up').click
		expect(page).to have_content '1 points'
		page.find('.glyphicon-chevron-down').clic
		expect(page).to have_content '0 points'
	end


end