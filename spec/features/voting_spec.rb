require 'spec_helper'

feature 'Vote' do
  scenario 'Up vote a submission only once' do
    user = create(:user)
    submission = create(:submission, user: user)
    sign_in_as(user)
    click_on 'Up vote'

    click_on 'Up vote'
    expect(page).to have_content 'Already voted!'
  end

  scenario 'Up vote a comment' do
    user = create(:user)
    submission = create(:submission)
    comment = create(:comment, submission: submission)
    sign_in_as(user)
    click_on "#{submission.title}"
    click_on 'View comments'
    click_on 'Up vote'
    expect(page).to have_content 'Voted up!'
  end
end
