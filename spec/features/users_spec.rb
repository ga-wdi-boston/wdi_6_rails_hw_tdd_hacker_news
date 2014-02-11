require 'spec_helper'

feature 'Manage Users' do
	background do
		user = User.create(email: 'mike@example.com', password: 'password')
		post = Post.create(description: 'A new post', link: 'http://www.google.com', user_id: 1)
		comment = Comment.create(body: 'A test comment body', post_id: 272, user_id: 1)
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
		visit new_post_path
		fill_in 'Description', with: 'A new post'
		fill_in 'Link', with: 'http://www.google.com'
		click_button 'Create Post'
		expect(page).to have_content('A new post')
	end

	scenario 'A user can upvote a post' do
		user = sign_in
		visit root_path
		post1 = Post.first

		upvotes = post1.upvotes
		click_on "^"

		# save_and_open_page

		expect(upvotes).to eq 1
	end

	scenario 'A user should be able to leave a comment' do
		user = sign_in
		visit posts_path
		click_on 'Leave a comment'
		fill_in 'Body', with: 'Comment body test'
		click_on 'Create Comment'
		save_and_open_page
		expect(page).to have_content('Comment body test')
	end

end
