require 'spec_helper'

feature 'Sign in' do
    scenario "Sign in as an existing user" do
      user = create(:user)
      sign_in_as(user)
    expect(page).to have_content('Hacker News')
  end
end
