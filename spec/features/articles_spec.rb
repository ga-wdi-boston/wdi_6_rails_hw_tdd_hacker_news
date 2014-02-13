require 'spec_helper'

feature 'Manage Articles' do

  background do
    user1 = create(:user)
    user2 = create(:user)
    @article1 = create(:article, title: 'two')
    @article2 = create(:article, title: 'one')
    @article3 = create(:article, title: 'three')

    create(:article_vote, votable: @article2, direction: true, user: user1)
    create(:article_vote, votable: @article2, direction: true, user: user2)
    create(:article_vote, votable: @article1, direction: false, user: user1)
    create(:article_vote, votable: @article3, direction: false, user: user2)
    create(:article_vote, votable: @article3, direction: false, user: user1)
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
