require 'spec_helper'

feature "sign up a user" do
	background do
		Article.create(title: "Star Trek", blurb: "to boldly go...", content: "xxxxxxxxx")
	end

	scenario 'sign up/sign out/sign in a new person' do
		visit articles_path
		click_link 'Sign Up'
		fill_in 'Email', with: 'test@email.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_on 'Sign Up'
		click_on 'Sign Out'
		visit articles_path
		click_link 'Sign In?'
		fill_in 'Email', with: 'test@email.com'
		fill_in 'Password', with: 'password'
		click_on 'Sign In?'
	end
end



