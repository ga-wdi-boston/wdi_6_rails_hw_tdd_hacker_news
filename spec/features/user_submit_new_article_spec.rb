require 'spec_helper'

feature 'User can submit a new article' do

  scenario 'successfully' do
    user = create(:user)
    article = create(:article, user: user)
    sign_in_as user
    click_on 'submit'
    fill_in 'title', with: article.title
    fill_in 'url', with: article.url
    fill_in 'text', with: article.text
    click_button 'submit'

    expect(page).to have_content(article.title)
    expect(page).to have_content(article.text)
  end
end
