require 'spec_helper'

feature 'user views all the posts' do

  scenario "a loged in user should be able to upvote a post and should not be able to vote twice" do
    user = create(:user)
    post = create(:post, title: 'Top 10 today', user: user)
    create(:post_vote, direction: 'true', user: user, votable: post)
    sign_in_as(user)

    expect(page).to have_content '1 points'
    click_on 'Up vote'
    expect(page).to have_content 'User has already been taken'
  end

  scenario "a loged in user should be able to downvote a post" do
    user = create(:user)
    post = create(:post, title: 'Top 10 today', user: user)
    create(:post_vote, direction: 'false', user: user, votable: post)
    sign_in_as(user)

    expect(page).to have_content '-1 points'
    click_on 'Down vote'
    expect(page).to have_content 'User has already been taken'
  end

end