require 'spec_helper'

feature "a user can see all the articles" do
	background do
		@x = Article.create(title: "Star Trek", blurb: "to boldly go...", content: "xxxxxxxxx")
		@y = Comment.create(content:"this is great", user_id: "1")
	end

	scenario 'users can log in and leave a comment' do
		# capybara which will allow you act as a user
		visit articles_path
		click_link 'Sign Up'
		fill_in 'Email', with: 'test@email.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_on 'Sign Up'
		visit articles_path
		click_link "Comment"
		save_and_open_page
		fill_in 'Content', with: 'yay!'
		click_on "Create Comment"
	end
end
