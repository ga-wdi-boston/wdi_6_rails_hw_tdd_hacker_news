require 'spec_helper'

feature "sign up a user" do
	background do
		Article.create(title: "Star Trek", blurb: "to boldly go...", content: "xxxxxxxxx")
	end

	scenario 'sign up a new person' do
		visit articles_path
		click_link 'Sign Up'
		fill_in 'Email', with: 'test@email.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_on 'Sign Up'
	end
end



