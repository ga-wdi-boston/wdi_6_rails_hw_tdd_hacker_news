require 'spec_helper'

feature 'A user can upvote a comment' do
	background do
		@user = create(:user)
		@post = create(:post, user: @user)
		@comment = create(:comment, user: @user, post: @post)
	end
	scenario 'successfully' do
		sign_in_as(@user)
		visit post_comments_path(@post)
		expect(page).to have_content(@post.description)
		click_on 'Upvote'
		expect(@comment.count_votes).to eq 1
	end

	scenario 'only once' do
		sign_in_as(@user)
		visit post_comments_path(@post)
		expect(page).to have_content(@post.description)
		click_on 'Upvote'
		click_on 'Upvote'
		expect(@comment.count_votes).to eq 1
	end
end

feature 'A user can downvote a comment' do
	background do
		@user = create(:user)
		@post = create(:post, user: @user)
		@comment = create(:comment, user: @user, post: @post)
	end

	scenario 'after upvoting' do
		sign_in_as(@user)
		visit post_comments_path(@post)
		expect(page).to have_content(@post.description)
		click_on 'Upvote'
		click_on 'Downvote'
		expect(@comment.count_votes).to eq 0
	end

	scenario 'only once' do
		sign_in_as(@user)
		visit post_comments_path(@post)
		expect(page).to have_content(@post.description)
		click_on 'Upvote'
		click_on 'Downvote'
		click_on 'Downvote'
		expect(@comment.count_votes).to eq 0
	end
end
