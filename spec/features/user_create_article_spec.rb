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

    expect(page).to have_content(article.title)
    expect(page).to have_content('Article saved!')
  end

  scenario 'unsuccessfully' do
    user = create(:user)
    article = create(:article, user: user)
    sign_in_as(user)

    click_on 'Submit New'
    fill_in 'Title', with: article.title
    click_button 'Submit'

    expect(page).to_not have_content(article.title)
    expect(page).to have_content('Nope, try again.')
  end

end
