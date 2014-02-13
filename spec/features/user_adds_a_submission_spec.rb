require 'spec_helper'

feature 'user adds a submission' do
	scenario 'a new submission is created' do
		visit new_submission_path
		expect(page).to have_content 'Create A New Submission'
		save_and_open_page
	end
end

require 'spec_helper'

