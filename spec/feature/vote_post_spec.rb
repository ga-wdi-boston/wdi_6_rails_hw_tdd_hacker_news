require 'spec_helper'

feature "comment link" do 
	before :each do
		Post.create(title: "Chris", links: "Clearfield")
	end
	scenario "Comment Vote up" do
	 	visit '/'
	 	click_on "Sign in"
	 	user = create(:user)
		sign_in_as(user)
	 	expect(page).to have_content("0 comments")
	 	click_on "^"
	 	expect(page).to have_content("1")
	 	click_on "-"
	 	expect(page).to have_content("1")
	 	click_on "Sign out"
	 	user = create(:another_user)
	 	sign_in_as(user)
	 	click_on "^"
	 	expect(page).to have_content("2")
	 	#end
	end
	scenario "Comment Vote down" do
	 	visit '/'
	 	click_on "Sign in"
	 	user = create(:user)
		sign_in_as(user)
	 	expect(page).to have_content("0 comments")
	 	click_on "^"
	 	expect(page).to have_content("1")
	 	click_on "Sign out"
	 	user = create(:another_user)
	 	sign_in_as(user)
	 	click_on "-"
	 	expect(page).to have_content("0")
	 	#end
	end

end
