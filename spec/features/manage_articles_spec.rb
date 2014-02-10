require 'spec_helper'

feature 'Manage articles' do

	scenario 'a signed in user can add an article' do
		visit new_article_path
		click_on 'Submit'
		fill_in 'Title', with: 'First article'
		fill_in 'URL', with: 'http://richardlynch.blogspot.com/'
		click_on 'Submit'

	end

end