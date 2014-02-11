require 'spec_helper'

feature 'Manage Articles' do

  background do
    Article.create(
      title: 'Richard Lynch, an awesome PHP community guy',
      url: 'http://richardlynch.blogspot.com/')
    Article.create(
      title: 'Facebook Fraud',
      url: 'http://www.youtube.com/watch?v=oVfHeWTKjag')
    Article.create(
      title: 'Mbox',
      url: 'http://pdos.csail.mit.edu/mbox/')
  end

  scenario 'View all article titles that are links to an ext webpage' do
    visit root_path
    expect(page).to have_selector "a[href='http://richardlynch.blogspot.com/']", text: 'Richard Lynch, an awesome PHP community guy'
    expect(page).to have_selector "a[href='http://www.youtube.com/watch?v=oVfHeWTKjag']", text: 'Facebook Fraud'
  end

end
