require 'spec_helper'

feature 'Sign in' do
    background do
      User.create(email: 'sixthemail@gmail.com', password: 'password6', password_confirmation: 'password6')
    end
    scenario "Sign in as an existing user" do
    visit root_path
    click_on 'Sign in'
    visit new_user_session_path
    fill_in 'Email', with: 'sixthemail@gmail.com'
    fill_in 'Password', with: 'password6'
    click_on 'Log in'
    expect(page).to have_content('Home')
  end
end
