require 'spec_helper'

feature 'User submits new vote on post' do

	background do
		@post = create(:post)
		user = create(:user)
		sign_in_as(user)
	end

	scenario 'upvote when they have not voted on that post before' do
		# view a post
		within("article.post_#{@post.id}") do
			click_link 'Comments'
		end

		# get initial vote count
		initial_votes = @post.votes

		# click on the upvote button for the post
		within(something) do
			click_link '[+]'
		end

		new_votes = @post.votes

		# vote should go up by one and [+] should disappear
		expect(new_votes).to_be (initial_votes + 1)
		expect(page).to_not have_content('[+]')
	end

	# scenario 'successfully' do
	# 	click_link 'Submit'
	# 	fill_in 'Title', with: 'DuckDuckGo'
	# 	fill_in 'Link', with: 'http://duckduckgo.com'
	# 	fill_in 'Description', with: 'better than Google?'
	# 	click_button 'Submit Link'

	# 	# expect new content
	# 	expect(page).to have_link('DuckDuckGo')
	# 	expect(page).to have_content('better than Google?')

	# 	# expect old content too
	# 	expect(page).to have_content(@post.description)
	# 	expect(page).to have_link(@post.title)
	# end



end
