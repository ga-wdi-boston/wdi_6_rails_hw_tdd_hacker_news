require 'spec_helper'

feature 'Leave comment as signed in user' do
  scenario 'Leave comment on a submission' do
    user = create(:user)
    submission = create(:submission)
    sign_in_as(user)
    click_on "#{submission.title}"
    click_on "Leave comment"
    fill_in "Body", with: "This is a comment"
    click_on 'Add Comment'
    expect(page).to have_content 'This is a comment'
  end
end
