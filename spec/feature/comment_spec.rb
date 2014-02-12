require 'spec_helper'

feature "comment link" do 
	before :each do
		Post.create(title: "Chris", links: "Clearfield")
	end
	scenario "Comment" do
	 	visit '/'
	 	click_on "Sign in"
	 	user = create(:user)
		sign_in_as(user)
	 	expect(page).to have_content("0 comments")
	 	#within "#1" do
 		click_on "0 comments"
	 	expect(page).to have_content("Add comment")
	 	click_on "Add comment"
	 	fill_in "Comment", with: "google.com"
	 	click_on "Create Comment"
	 	expect(page).to have_content("google.com")
		# fill_in "Password confirmation", with: "asdfasdf"
	end

end
