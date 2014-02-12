require 'spec_helper'

feature "comment link" do 
	before :each do
		Post.create(title: "Chris", links: "Clearfield")
	end
	scenario "Comment Vote" do
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
	 	expect(page).to have_content("0")
	 	click_on "^"
	 	expect(page).to have_content("1")
	 	click_on "-"
	 	expect(page).to have_content("1")
	 	click_on 'back'
	 	expect(page).to have_content("Sign out")
	 	click_on "Sign out"
	 	user = create(:another_user)
	 	sign_in_as(user)
	 	expect(page).to have_content("1 comments")
	 	# click_on "-" 
	 	click_on "1 comments"
	 	expect(page).to have_content("Vote the comment")
	 	click_on "^"
	 	expect(page).to have_content("2")
	 	#end
	end

end
