require 'spec_helper'

feature 'Manage Submissions' do
  background do
    @submission1 = create(:submission)
    @submission2 = create(:submission)
    @submission3 = create(:submission)
  end

  scenario 'View all submissions as a visitor' do
    visit submissions_path
    expect(page).to have_content(@submission1.title)
    expect(page).to have_content(@submission2.title)
    expect(page).to have_content(@submission3.title)
  end

  scenario 'Make a submission as a signed in user' do
    user = create(:user)
    sign_in_as(user)
    save_and_open_page
    click_on "New Submission"
    fill_in 'Title', with: ('Second Article')
    fill_in 'Link', with: ('www.article.com')
    fill_in 'Description', with: ('This is the second article')
    click_on 'Add'
    expect(page).to have_content('Second Article')
  end
end
