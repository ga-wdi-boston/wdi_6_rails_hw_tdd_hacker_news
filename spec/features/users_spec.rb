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

	scenario 'sign in as a user and add an article' do
		visit articles_path
		click_link 'Sign Up'
		fill_in 'Email', with: 'test3@email.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		# save_and_open_page
		click_on 'Sign Up'
		visit articles_path
		click_link 'Add Article'
		save_and_open_page
		fill_in 'Title', with: 'Pacific Rim'
		fill_in 'Blurb', with: 'this was a great movie'
		fill_in 'Content', with: 'giant robots with neural links to two pilots! fight monsters!'
		click_on 'Create Article'
		expect(page).to have_content("All Articles")
		expect(page).to have_content("Pacific Rim")
		expect(page).to have_content("great")
	end

end



