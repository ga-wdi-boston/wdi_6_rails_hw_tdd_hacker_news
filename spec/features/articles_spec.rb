require 'spec_helper'

feature 'Manage Articles' do

  background do
    Article.create(title: 'Cats', url: 'http://www.youtube.com/')
  end

  scenario 'View all articles as a visitor' do
    visit root_path
    expect(page).to have_content('Cats')
  end
end
