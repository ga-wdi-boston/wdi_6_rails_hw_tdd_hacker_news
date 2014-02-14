require 'spec_helper'

feature 'User submits new comment' do

	background do
		@post = create(:post)
		@comment_1 = create(:comment, post: @post)
		@comment_2 = create(:comment, post: @post)
		user = create(:user)
		sign_in_as(user)
	end

	scenario 'successfully' do

		# click on a post's comments
		within("article.post_#{@post.id}") do
			click_link 'Comments'
		end

		# write a new comment
		fill_in 'Body', with: 'sample comment'
		click_button 'Submit Comment'

		# expect new comment to show up
		expect(page).to have_content('sample comment')

		# expect old comments too
		expect(page).to have_content(@comment_1.body)
		expect(page).to have_content(@comment_2.body)

	end

	scenario 'unsuccessfully because they left the body blank' do

		# click on a post's comments
		within("article.post_#{@post.id}") do
			click_link 'Comments'
		end

		# no text, just click submit
		click_button 'Submit Comment'

		# expect error message
		expect(page).to have_content("can't be blank")

		# expect old comments to still be there
		expect(page).to have_content(@comment_1.body)
		expect(page).to have_content(@comment_2.body)
	end

end
