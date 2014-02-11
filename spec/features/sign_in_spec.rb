require 'spec_helper'

feature 'Sign in' do
    scenario "Sign in as an existing user" do
    visit root_path
    click_on 'Sign up'
    visit new_user_registration_path
    fill_in 'Email', with: 'example@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Submit'
    expect(page).to have_content('Welcome')
  end
end
