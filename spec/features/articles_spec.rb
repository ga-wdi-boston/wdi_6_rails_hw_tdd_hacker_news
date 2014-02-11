require 'spec_helper'

feature "a user can see all the articles" do
	background do
		Article.create(title: "Star Trek", blurb: "to boldly go...", content: "xxxxxxxxx")
	end

	scenario 'view all movies as a vistor' do
		# capybara which will allow you act as a user
		visit articles_path
		# save_and_open_page
		expect(page).to have_content("Star Trek")
		expect(page).to have_content("to boldly go...")
	end
end
