
require 'spec_helper'

feature "user can leave a comment" do
	background do
		@x = Article.create(title: "Star Trek", blurb: "to boldly go", url: "https://github.com/")
	end

	scenario 'users can log in and leave a comment' do
		user = create(:user)
		visit root_path
		click_link 'Sign In?'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		visit articles_path
		click_link "comment"
		save_and_open_page
		fill_in 'content', with: 'yay!'
		click_on "create comment"
	end
end
