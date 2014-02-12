require 'spec_helper'

feature 'User creates a new article' do

  scenario 'successfully' do
    user = create(:user)
    article = create(:article, user: user)
    sign_in_as(user)

    click_on 'Submit New'
    fill_in 'Title', with: article.title
    fill_in 'URL', with: article.url
    click_button 'Create Article'


    expect(page).to have_content(article.title)
  end

end
