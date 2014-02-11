require 'spec_helper'

feature "a user can see all the articles" do
	background do
		Article.create(title: "Star Trek", blurb: "to boldly go...", content: "xxxxxxxxx")
	end

	scenario 'view all articles as a vistor' do
		# capybara which will allow you act as a user
		visit articles_path
		# save_and_open_page
		expect(page).to have_content("Star Trek")
		expect(page).to have_content("to boldly go...")
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
		#save_and_open_page
		fill_in 'Title', with: 'Pacific Rim'
		fill_in 'Blurb', with: 'this was a great movie'
		fill_in 'Content', with: 'giant robots with neural links to two pilots! fight monsters!'
		click_on 'Create Article'
		expect(page).to have_content("All Articles")
		expect(page).to have_content("Pacific Rim")
		expect(page).to have_content("great")
	end

end

