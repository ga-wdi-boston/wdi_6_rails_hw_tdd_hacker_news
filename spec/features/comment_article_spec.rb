require 'spec_helper'

feature 'User can comment on an article' do

  background do
    @user = create(:user)
    @user1 = create(:user)
    @user2 = create(:user)
    @article = create(:article, user: @user)
    @comment1 = create(:comment, article: @article, content: 'two')
    @comment2 = create(:comment, article: @article, content: 'one')
    @comment3 = create(:comment, article: @article, content: 'three')

    create(:comment_vote, votable: @comment2, direction: true, user_id: @user1.id)
    create(:comment_vote, votable: @comment2, direction: true, user_id: @user2.id)
    create(:comment_vote, votable: @comment1, direction: false, user_id: @user1.id)
    create(:comment_vote, votable: @comment3, direction: false, user_id: @user2.id)
    create(:comment_vote, votable: @comment3, direction: false, user_id: @user1.id)
  end

  scenario 'successfully' do
    sign_in_as @user
    comment = build(:comment, article: @article)
    # save_and_open_page
    click_on 'comments'
    fill_in 'content', with: comment.content
    click_button 'add comment'

    expect(page).to have_content(comment.content)
  end

  scenario 'unsuccessfully' do
    sign_in_as @user
    click_on 'comments'
    click_button 'add comment'

    expect(page).to have_content("Content can't be blank")
  end

  scenario 'view comments in order of votes, descending' do
    visit root_path
    click_on 'comments'
    expect(page).to have_content(/.*one.*two.*three/)
  end
end
