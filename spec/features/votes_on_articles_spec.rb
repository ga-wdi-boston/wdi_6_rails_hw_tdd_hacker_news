require 'spec_helper'

feature "user can up-vote an article" do

	scenario 'user signs in and up-votes an article' do
		create(:article)
		user = create(:user)
		visit articles_path
		click_link 'Sign In?'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		visit root_path
		click_on 'vote up on article'
		expect(page).to have_content 'up vote.'
		expect(page).to have_content 'All Articles'
		click_link 'more'
		expect(page).to have_content '1'
	end

	scenario 'user signs in and down-vote an article' do
		create(:article)
		user = create(:user)
		visit articles_path
		click_link 'Sign In?'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		visit root_path
		click_on 'vote down on article'
		expect(page).to have_content 'down vote.'
		expect(page).to have_content 'All Articles'
		click_link 'more'
		expect(page).to have_content '1'
	end
end
