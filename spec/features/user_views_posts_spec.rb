require 'spec_helper'

feature 'User all the posts' do
  scenario 'show all the post of a certain user' do

    user = create(:user)
    create(:post, title: 'Top 10 today', user: user)
    create(:post, title: 'Great story', user: user)
    create(:post, title: 'Obama', user: user)
    create(:post, title: 'Jerkface')

    sign_in_as(user)
    expect(page).to have_content 'Top 10 today'
    expect(page).to have_content 'Great story'
    expect(page).to have_content 'Obama'
  end

  scenario 'show all the comments of a certain post' do

      @user = create(:user)
      @post = create(:post, title: 'Top 3 today', user: @user)


      create(:comment, body: 'Awesome!', user: @user, post: @post)
      sign_in_as(@user)
      visit post_path(@post)

      expect(page).to have_content 'Awesome!'
  end


end
