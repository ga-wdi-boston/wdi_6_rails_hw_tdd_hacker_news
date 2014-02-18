require 'spec_helper'

feature 'Manage Users' do


	scenario 'A user should be able to create an article' do
		user = User.create(email: 'jim@example.com', password: 'Password')
		visit new_user_session_path
		fill_in 'Email', with: user.email
 		fill_in 'Password', with: user.password
 		click_button 'Sign in'
 		visit new_article_path
		fill_in 'Description', with: 'First article'
 		fill_in 'Link', with: 'http://www.articlemania.com'
		click_button 'Create Article'
 		expect(page).to have_content('First article')
 	end

end
