require 'spec_helper'

feature 'Manage articles' do

	scenario 'a signed in user can add an article' do
		visit new_article_path
		fill_in 'Title', with: 'First article'
		fill_in 'Url', with: 'http://richardlynch.blogspot.com/'
		click_on 'Submit'
		expect(page).to have_content 'First article'

	end

end