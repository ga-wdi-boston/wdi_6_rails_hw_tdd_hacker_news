# require 'spec_helper'

# feature "user can up-vote a comment or article" do

# 	scenario 'user signs in and up-votes an article' do
# 		visit articles_path
# 		@user = create(:user)
# 		visit root_path
# 		click_link 'Sign In?'
# 		fill_in 'Email', with: @user.email
# 		fill_in 'Password', with: @user.password
# 		click_button 'Sign in'
# 		visit root_path
# 		click_link "article title"
# 		click_on "up-vote"
# 		expect(page).to have_content 'votes'
# 	end
# end
