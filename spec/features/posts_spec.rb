require 'spec_helper'

feature "Manage a user" do
  before :each do
    @Joe = User.create(email: "Joe@gmail.com", password: "password")
    @post = Post.create(title: "Top 10 today", body: "This is an empty post")
    @Joe.posts << @post
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

    visit new_post_path(@post)
    fill_in 'Title', with: 'Top 10 today'
    fill_in 'Body', with: 'This is an empty post'
    click_on 'Create Post'

    expect(page).to have_content("Hacker News")
    expect(page).to have_content("Top 10 today")


  end

  scenario "Make a comment" do
    visit new_user_session_path
    fill_in 'Email', with: "Joe@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Sign in'

    visit new_post_path(@post)
    fill_in 'Title', with: 'Top 10 today'
    fill_in 'Body', with: 'This is an empty post'
    click_on 'Create Post'

    visit new_post_comment_path(@post)
    fill_in 'Body', with: 'Pretty Decent!'
    click_on 'Create Comment'

    expect(page).to have_content('Pretty Decent')

  end


end