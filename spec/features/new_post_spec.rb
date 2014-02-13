require 'spec_helper'

feature "Create a new post" do

	scenario "As a signed-in user" do
		sign_in
		click_on 'New post'
		fill_in 'Body', with: "test title"
		fill_in 'Link', with: "http://www.example.com"
		click_on 'Create Post'
		save_and_open_page

	end

end