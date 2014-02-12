require 'spec_helper'

feature 'User can vote only once and' do
  background do
    @user = create(:user)
    @article = create(:article, user: @user)
  end

  scenario 'vote up' do
    sign_in_as @user
    click_on 'vote up'
    expect(page).to have_content(1)
    click_on 'vote up'
    expect(page).to have_content(1)
  end

  scenario 'vote down' do
    sign_in_as @user
    click_on 'vote down'
    expect(page).to have_content(-1)
    click_on 'vote up'
    expect(page).to have_content(-1)
  end
end


