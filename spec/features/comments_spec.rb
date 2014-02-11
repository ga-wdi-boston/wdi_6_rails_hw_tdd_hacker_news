require 'spec_helper'

feature 'Add comments' do

	scenario 'a signed in user can add a comment' do
		sign_up_with('em@example.com', 'password')
		create_article
		click_on 'Add comment'
		fill_in 'Body', with: 'New comment text'
		save_and_open_page
		click_on 'Submit comment'

		expect(page).to have_content 'New comment text'

	end

end