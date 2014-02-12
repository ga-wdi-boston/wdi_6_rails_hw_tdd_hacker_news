require 'spec_helper'

feature 'User can vote up only once' do
  background do
    @user = create(:user)
    @article = create(:article, user: @user)
  end

  scenario 'successfully' do
    sign_in_as @user
    click_on 'vote up'
    expect(page).to have_content(1)
    click_on 'vote up'
    expect(page).to have_content(1)
  end
end
