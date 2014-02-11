require 'spec_helper'

feature 'Manage Submissions' do
  background do
    Submission.create(title: 'First Article', link: 'www.website.com', description: 'This is a great article')
  end

  scenario 'View all submissions as a visitor' do
    visit submissions_path
    expect(page).to have_content('First Article')
    expect(page).to have_content('www.website.com')
    expect(page).to have_content('This is a great article')
  end
end
