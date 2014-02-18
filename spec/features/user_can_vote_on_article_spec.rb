require 'spec_helper'

feature 'User can up vote an article' do
	background do
			user = create(:user)
			sign_in_as user
			@article = create(:article, user: user)
	end

	scenario 'successfully' do
		visit root_path
		click_button 'Up Vote'

		expect(page).to have_content 'Total Number of Votes: 1'
	end
end


feature 'User can down vote an article' do
	background do
			user = create(:user)
			sign_in_as user
			@article = create(:article, user: user)
	end

	scenario 'successfully' do
		visit root_path
		click_button 'Down Vote'

		expect(page).to have_content 'Total Number of Votes: -1'
	end
end
