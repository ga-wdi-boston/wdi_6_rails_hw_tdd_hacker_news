require 'spec_helper'

feature 'User upvotes an article' do

	background do
		user = create(:user)
		sign_in_as(user)
		article = create(:article, user: user)
	end

	scenario 'successfully' do
		visit root_path
		within('.article') do
			find('.glyphicon-chevron-up').click
		end
		expect(page).to have_content '1 point'
	end

end

feature 'Logged out user cant upvote article' do

	background do
		user = create(:user)
		sign_in_as(user)
		article = create(:article)
		article.votes << create(:vote, up: true)
	end

	scenario 'unsuccessfully if not logged in' do
		click_link 'Sign out'
		visit root_path
		within('.article') do
			find('.glyphicon-chevron-up').click
		end
		expect(page).to have_content '1 point'
	end
end