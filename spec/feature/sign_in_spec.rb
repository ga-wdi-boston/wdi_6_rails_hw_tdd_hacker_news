require 'spec_helper'

feature "Sign In" do 

	scenario "Sign in" do
		 visit '/users/sign_in'
		 expect(page).to have_content("Sign in")
		 fill_in "Email", with: "songyiyang@gmail.com"
		 fill_in "Password", with: "asdfasdf"
		# fill_in "Password confirmation", with: "asdfasdf"
		 click_on "Sign in"
	end

end
