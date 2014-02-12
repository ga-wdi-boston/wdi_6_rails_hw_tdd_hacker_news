require 'spec_helper'

feature 'A new user signs up' do
  background do
    visit root_path
    click_link 'Sign up'
  end

  scenario 'successfully' do
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'Signed in as bob@example.com'
    expect(page).to have_link 'Sign out'
  end

  scenario 'unsuccessfully' do
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'notapassword'
    click_button 'Sign up'

    expect(page).to have_content "doesn't match"
  end
end
