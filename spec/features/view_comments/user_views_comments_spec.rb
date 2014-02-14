require 'spec_helper'

feature 'User views all comments for a post' do

	background do
			# create some articles
		@post = create(:post)

		# create some comments for them
		@comment_1 = create(:comment, post: @post)
		@comment_2 = create(:comment, post: @post)

		# login
		user = create(:user)
		sign_in_as(user)

	end

	scenario 'successfully (while signed in)' do
		# go to root
		visit root_path

		# click on one of the articles
		within("article.post_#{@post.id}") do
			click_link 'Comments'
		end

		# see the comments
		expect(page).to have_content(@post.title)
		expect(page).to have_content(@post.description)
		expect(page).to have_content(@comment_1.body)
		expect(page).to have_content(@comment_2.body)

	end

end
