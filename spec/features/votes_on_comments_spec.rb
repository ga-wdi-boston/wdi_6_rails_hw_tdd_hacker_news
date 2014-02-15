

require 'spec_helper'

feature "user can up-vote a comment or article" do
	scenario 'user signs in and up-votes a comment' do
			x = create(:article)
			y = Comment.create(content: "do do do do")
			x.comments << y
			user = create(:user)
			visit articles_path
			click_link 'Sign In?'
			fill_in 'Email', with: user.email
			fill_in 'Password', with: user.password
			click_button 'Sign in'
			visit root_path
			click_on 'more'
			click_on 'see and post comments!'
			save_and_open_page
			click_link 'up vote'
			expect(page).to have_content 'up vote.'
		end

		scenario 'user signs in and down-votes a comment' do
			x = create(:article)
			y = Comment.create(content: "do do do do")
			x.comments << y
			user = create(:user)
			visit articles_path
			click_link 'Sign In?'
			fill_in 'Email', with: user.email
			fill_in 'Password', with: user.password
			click_button 'Sign in'
			visit root_path
			click_on 'more'
			click_on 'see and post comments!'
			click_link 'down vote'
			expect(page).to have_content 'down vote.'
		end
end
