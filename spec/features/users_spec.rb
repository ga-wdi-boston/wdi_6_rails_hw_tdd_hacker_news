require 'spec_helper'

feature 'Manage Users' do
	background do
		user = User.create(email: 'mike@example.com', password: 'password')
	end

	scenario 'A user should be able to sign up' do
		visit new_user_registration_path
		fill_in 'Email', with: 'mike1@example.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_on 'Sign up'
		expect(page).to have_content('All Posts')
	end

	scenario 'A user should be able to sign in' do
		visit new_user_session_path
		fill_in 'Email', with: 'mike@example.com'
		fill_in 'Password', with: 'password'
		click_on 'Sign in'
		expect(page).to have_content('All Posts')
	end

	scenario 'A user should be able to create a post' do
		user = sign_in
		visit new_user_post_path(user.id)
		fill_in 'Description', with: 'A new post'
		fill_in 'Link', with: 'http://www.google.com'
		click_button 'Create Post'
		expect(page).to have_content('A new post')
	end
end
