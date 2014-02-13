require 'spec_helper'

feature 'Vote' do
  scenario 'Up vote a submission' do
    user = create(:user)
    submission = create(:submission, user: user)
    sign_in_as(user)
    click_on 'Up vote'
    expect(page).to have_content '1'
  end

  scenario 'Up vote a comment' do
    user = create(:user)
    submission = create(:submission)
    comment = create(:comment, submission: submission)
    sign_in_as(user)
    click_on "#{submission.title}"
    click_on 'View comments'
    click_on 'Up vote'
    expect(page).to have_content 'Vote Count'
  end
end
