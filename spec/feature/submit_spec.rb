require 'spec_helper'

feature "submit link" do 

	scenario "Submit" do
	 	visit '/'
	 	expect(page).to_not have_content ("Submit link")
	 	click_on "Sign in"
	 	user = create(:user)
		sign_in_as(user)
		
	 	expect(page).to have_content("Submit link")
	 	click_on "Submit link"
	 	fill_in "Links", with: "google.com"
	 	fill_in "Title", with: "Google"
	 	click_on "Create Post"
	 	expect(page).to have_content("Google")
		# fill_in "Password confirmation", with: "asdfasdf"
	end

end
