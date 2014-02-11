# require 'spec_helper'

# feature "User can create a new post" do

# 	scenario "Signed-in user can create a post" do
# 		# All this just to get a sample user
# 		visit new_user_registration_path
# 	  fill_in 'Email', with: "matt@aol.com"
#   	fill_in 'Password', with: "12341234"
#  		fill_in 'Password confirmation', with: "12341234"
# 		click_on 'Sign up'
# 		click_on 'Sign out'
# 	  visit new_user_session_path
# 	  fill_in 'Email', with: 'matt@aol.com'
# 	  fill_in "Password", with: "12341234"
# 	  click_on "Sign in"
# 	  user =
# 	  # Now we actually post from that user to the nested route /users/1/posts/1
# 	  visit new_user_post_path(user.id)
# 	  save_and_open_page


# 	end


# end