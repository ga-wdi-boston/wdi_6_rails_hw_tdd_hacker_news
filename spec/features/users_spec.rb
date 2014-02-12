require 'spec_helper'

feature 'Manage Users' do
	background do
		@user = create(:user)
		@post = create(:post, user: @user)
		@comment = create(:comment, user: @user, post: @post)
	end

	scenario 'A user should be able to sign up' do
		visit new_user_registration_path
		fill_in 'Email', with: 'mike1@example.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		within('form') do
			click_on 'Sign up'
		end
		expect(page).to have_content("Signed in as mike1@example.com")
	end

	scenario 'A user should be able to sign in' do
		visit new_user_session_path
		fill_in 'Email', with: @user.email
		fill_in 'Password', with: @user.password
		# save_and_open_page
		within('form') do
			click_on 'Sign in'
		end
		expect(page).to have_content("Signed in as #{@user.email}")
	end

	scenario 'A user should be able to create a post' do
		sign_in_as(@user)
		visit new_post_path
		fill_in 'Description', with: 'A new test post'
		fill_in 'Link', with: 'Test post body'
		click_button 'Create Post'
		expect(page).to have_content('A new post')
	end

	scenario 'A user can upvote a post' do
		sign_in_as(@user)
		visit root_path
		expect(page).to have_content(@post.description)
		click_on 'Upvote'
		expect(@post.count_votes).to eq 1
	end

	scenario 'A user can downvote a post' do
		sign_in_as(@user)
		visit root_path
		expect(page).to have_content(@post.description)
		click_on 'Upvote'
		expect(@post.count_votes).to eq 1
		click_on 'Downvote'
		expect(@post.count_votes).to eq 0
	end

	scenario 'A user should be able to leave a comment' do
		sign_in_as(@user)
		visit posts_path
		click_on 'comment'
		click_on 'Leave a comment'
		save_and_open_page
		fill_in 'Body', with: 'Comment body test'
		click_on 'Create Comment'
		expect(page).to have_content('Comment body test')
	end

end
