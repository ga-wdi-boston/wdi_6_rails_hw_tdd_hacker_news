require 'spec_helper'

feature 'User creates a new article' do

  scenario 'successfully' do
    user = create(:user)
    article = create(:article, user: user)
    sign_in_as(user)

    click_on 'Submit New'
    fill_in 'Title', with: article.title
    fill_in 'URL', with: article.url
    click_button 'Submit'
    save_and_open_page

    expect(page).to have_content(article.title)
    expect(page).to have_content('Article saved!')
  end
end
