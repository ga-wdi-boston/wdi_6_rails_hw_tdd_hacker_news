# require 'spec_helper'

# feature "user can up-vote a comment or article" do

# 	scenario 'user signs in and up-votes an article' do
# 		create(:article)
# 		user = create(:user)
# 		visit articles_path
# 		click_link 'Sign In?'
# 		fill_in 'Email', with: user.email
# 		fill_in 'Password', with: user.password
# 		click_button 'Sign in'
# 		visit root_path
# 		click_link 'more'
# 		click_on 'vote on article'
# 		expect(page).to have_content 'Vote'
# 		click_on 'up_vote'
# 		expect(page).to have_content 'All Articles'
# 		click_link 'more'
# 		expect(page).to have_content 'votes:1'
# 	end

# 	scenario 'user signs in and down-votes an article' do
# 		create(:article)
# 		user = create(:user)
# 		visit articles_path
# 		click_link 'Sign In?'
# 		fill_in 'Email', with: user.email
# 		fill_in 'Password', with: user.password
# 		click_button 'Sign in'
# 		visit root_path
# 		click_link 'more'
# 		click_on 'vote on article'
# 		expect(page).to have_content 'Vote'
# 		click_on 'down_vote'
# 		expect(page).to have_content 'All Articles'
# 		click_link 'more'
# 		save_and_open_page
# 		expect(page).to have_content 'votes:1'
# 	end
# end
