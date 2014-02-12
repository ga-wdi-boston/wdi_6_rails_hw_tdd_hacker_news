require 'spec_helper'

feature 'User submits new post' do

	background do
		@post = create(:post)
		user = create(:user)
		sign_in_as(user)
	end

	scenario 'successfully' do
		click_link 'Submit'
		fill_in 'Title', with: 'DuckDuckGo'
		fill_in 'Link', with: 'http://duckduckgo.com'
		fill_in 'Description', with: 'better than Google?'
		click_button 'Submit Link'

		# expect new content
		expect(page).to have_link('DuckDuckGo')
		expect(page).to have_content('better than Google?')

		# expect old content too
		expect(page).to have_content(@post.description)
		expect(page).to have_link(@post.title)
	end

	scenario 'unsuccessfully because they left some fields blank' do
		click_link 'Submit'
		fill_in 'Title', with: 'NY Times'
		fill_in 'Description', with: 'singlehandledly keeping the newspaper industry afloat'
		click_button 'Submit Link'

		expect(page).to have_content("can't be blank")
		expect(page).to have_button('Submit Link')
	end

end
