require 'spec_helper'

feature 'Visitor views all comments for a post' do

	background do
		# don't create user because we're not logged in

		# create some articles
		@post = create(:post)

		# create some comments for them
		@comment_1 = create(:comment, post: @post)
		@comment_2 = create(:comment, post: @post)
	end

	scenario 'successfully (while signed out)' do
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
