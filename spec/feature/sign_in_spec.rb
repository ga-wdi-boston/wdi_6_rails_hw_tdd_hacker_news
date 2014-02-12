require 'spec_helper'

feature "Sign In" do 

	scenario "Sign in" do
		 visit '/'
		 user = create(:user)
		 expect(page).to have_content("Sign in")
		 click_on "Sign in"
		 sign_in_as(user)
		# fill_in "Password confirmation", with: "asdfasdf"
	end

end
