require 'spec_helper'

feature 'A user signs in' do
  background do
    visit new_user_session_path
    @user = create(:user)
  end

  scenario 'successfully' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'

    expect(page).to have_content "Signed in as #{@user.email}"
    expect(page).to have_link 'Sign out'
  end

  scenario 'unsuccessful with invalid credentials' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'incorrect'
    click_button 'Sign in'

    expect(page).to have_content 'Invalid email or password.'
    expect(page).to_not have_content 'Signed in'
  end

end
