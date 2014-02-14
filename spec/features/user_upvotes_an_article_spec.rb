require 'spec_helper'

feature 'user upvotes an article' do
	scenario 'the number of votes an article has increases by 1' do
	user = create(:user)
	submission = create(:submission)
		visit root_path
		click_link('Upvote This Submission', match: :first)
		expect(page).to have_content 'Vote Recorded'
	end
end
