require 'spec_helper'

feature 'A new user signs up' do
  background do
    visit root_path
    save_and_open_page
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
end
