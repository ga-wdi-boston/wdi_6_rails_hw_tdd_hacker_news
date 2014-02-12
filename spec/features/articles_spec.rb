require 'spec_helper'

feature 'Manage Articles' do

  background do
    user1 = create(:user)
    user2 = create(:user)
    @article1 = create(:article, title: 'two')
    @article2 = create(:article, title: 'one')
    @article3 = create(:article, title: 'three')

    create(:article_vote, votable: @article2, direction: true, user_id: user1.id)
    create(:article_vote, votable: @article2, direction: true, user_id: user2.id)
    create(:article_vote, votable: @article1, direction: false, user_id: user1.id)
    create(:article_vote, votable: @article3, direction: false, user_id: user2.id)
    create(:article_vote, votable: @article3, direction: false, user_id: user1.id)
  end

  scenario 'View all article titles that are links to an ext webpage' do
    visit root_path
    expect(page).to have_content @article1.title
  end

  scenario 'view articles in order of votes, descending' do
    visit root_path
    expect(page).to have_content(/.*one.*two.*three/)
  end

end
