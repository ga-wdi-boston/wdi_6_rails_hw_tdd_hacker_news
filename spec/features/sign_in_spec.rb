require 'spec_helper'

feature 'Sign in' do
    scenario "Sign in as an existing user" do
    visit root_path
    click_on 'Sign in'
    visit new_user_session_path
    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    #expect(page).to have_content('Home')
  end
end
