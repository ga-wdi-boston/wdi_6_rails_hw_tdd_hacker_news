require 'spec_helper'

feature "Sign Up" do 

	scenario "Sign up" do
		visit '/users/sign_up'
		expect(page).to have_content("Sign up")
		fill_in "Email", with: "songyiyang@gmail.com"
		fill_in "Password", with: "asdfasdf"
		fill_in "Password confirmation", with: "asdfasdf"
		click_on "Sign up"
		expect(page).to have_content("All Movies")
	end

end
