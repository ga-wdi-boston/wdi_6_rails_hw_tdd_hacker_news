require 'spec_helper'

feature 'Visitor signs in' do
  background do
    visit new_user_session_path
    @user = create(:user)
  end

  scenario 'successfully' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'

    expect(page).to have_content "Signed in as #{@user.email}"
    expect(page).to have_link 'Sign Out'
  end

  scenario 'unsuccessful with invalid credentials' do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'wrongpassword'
  click_button 'Sign in'

  expect(page).to have_content 'Invalid email or password.'
  expect(page).to_not have_content 'Signed in'
  end
end

feature 'Visitor signs up' do
  background do
    visit root_path
    click_link 'Sign up'
  end

  scenario 'successfully' do
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome!'
    expect(page).to have_content 'Signed in as bob@example.com'
    expect(page).to have_link 'Sign Out'
  end

  scenario 'unsuccessfully with blank fields' do
  click_button 'Sign up'
    expect(page).to_not have_content 'Signed in'
    expect(page).to have_content "can't be blank"
  end

end

feature 'User signs out' do
  scenario 'successfully' do
    user = create(:user)
    sign_in_as(user)

    click_link 'Sign Out'

    expect(page).to_not have_content 'Signed in'
  end
end
