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

  scenario 'Make a submission as a signed in user' do
    user = create(:user)
    sign_in_as(user)
    click_on "New Submission"
    fill_in 'Title', with: ('Second Article')
    fill_in 'Link', with: ('www.article.com')
    fill_in 'Description', with: ('This is the second article')
    click_on 'Add'
    expect(page).to have_content('Second Article')
  end
end
