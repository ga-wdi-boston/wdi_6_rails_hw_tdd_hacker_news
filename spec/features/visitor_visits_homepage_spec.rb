require 'spec_helper'

feature 'visitor lands on site index and' do
	scenario 'sees all submissions on homepage' do
	submission = create(:submission)
		visit submissions_path
		expect(page).to have_content 'A Wonderful Story'
	save_and_open_page
	end

	scenario 'sees users associated with each submission' do
	submission = create(:submission)
		visit submissions_path
		expect(page).to have_content 'becky@email.com'
	end

	scenario 'sees comments association with each submission' do
		submission = create(:submission)
		visit submissions_path
		expect(page).to have_link 'Add Comment'
	end

end
