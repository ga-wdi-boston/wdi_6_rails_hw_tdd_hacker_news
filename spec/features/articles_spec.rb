require 'spec_helper'

feature "a user can see all the articles" do
	background do
		Article.create(title: "Star Trek", blurb: "to boldly go...", url: "https://www.google.com/")
	end

	scenario 'view all articles as a vistor' do
		visit articles_path
		expect(page).to have_content("Star Trek")
		expect(page).to have_content("to boldly go...")
	end

	scenario 'view just one articles as a vistor' do
		visit articles_path
		expect(page).to have_content("Star Trek")
		expect(page).to have_content("to boldly go...")
		click_on "more"
		expect(page).to have_content("Star Trek")
		expect(page).to have_content("to boldly go...")
	end

	scenario 'sign in as a user and add an article' do
		visit articles_path
		click_link 'Sign Up'
		fill_in 'Email', with: 'test3@email.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_on 'Sign Up'
		visit articles_path
		click_link 'add article'
		fill_in 'Title', with: 'Pacific Rim'
		fill_in 'Blurb', with: 'this was a great movie'
		fill_in 'Url', with: 'https://www.google.com/'
		click_on 'create article'
		expect(page).to have_content("Pacific Rim")
	end

end

