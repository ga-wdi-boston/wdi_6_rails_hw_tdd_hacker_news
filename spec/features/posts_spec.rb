require 'spec_helper'

feature "Manage a user" do
  before :each do
    @Joe = User.create(email: "Joe@gmail.com", password: "password")
    @post = Post.create(title: "Top 10 today", body: "This is an empty post")
  end

  scenario "a user should be able to sign up" do
    visit new_user_registration_path
    fill_in 'Email', with: "sean@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
  end

  scenario "a user should be able to sign in" do
    visit new_user_session_path
    fill_in 'Email', with: "sean@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Sign in'
  end

  scenario "Submit a new post" do
    visit new_user_session_path
    fill_in 'Email', with: "Joe@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Sign in'

    visit new_user_post_path(@Joe)
    fill_in 'Title', with: 'Top 10 today'
    fill_in 'Body', with: 'This is an empty post'
    click_on 'Create Post'

    expect(page).to have_content("View all posts")
    expect(page).to have_content("Top 10 today")
    expect(page).to have_content('This is an empty post')
    save_and_open_page
  end
end