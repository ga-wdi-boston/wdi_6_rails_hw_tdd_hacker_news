require 'spec_helper'

feature 'Sign in' do

  scenario "a signed up user" do
    visit new_user_session_path
    fill_in 'Email', with: 'tom@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
  end
end