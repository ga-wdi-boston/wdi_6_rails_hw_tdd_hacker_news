require 'spec_helper'

feature 'User can comment on an article' do

  background do
    @user = create(:user)
    @article = create(:article, user: @user)
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
end
