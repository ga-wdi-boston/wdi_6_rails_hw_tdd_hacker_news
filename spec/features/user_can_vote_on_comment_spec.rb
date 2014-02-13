require 'spec_helper'

feature 'User can vote on a comment' do
	background do
			user = create(:user)
			sign_in_as user
			@article = create(:article, user: user)
			@comment = create(:comment, user: user)
	end

	scenario 'successfully' do
		visit root_path
		click_link 'Comments'
		click_link 'Write a Comment'
		fill_in 'Body', with: @comment
		click_button 'Create Comment'
		click_button 'Up Vote'

		current_path.should == "/"
	end

end
