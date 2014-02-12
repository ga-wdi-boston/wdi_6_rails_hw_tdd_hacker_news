require 'spec_helper'

feature 'Vote' do
  scenario 'Up vote a submission' do
    user = create(:user)
    submission = create(:submission)
    sign_in_as(user)
    click_on 'Up vote'
    expect(page).to have_content '1'
  end
end
