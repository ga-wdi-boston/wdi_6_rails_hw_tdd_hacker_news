require 'spec_helper'

feature 'User can create a new article' do
	scenario 'successfully' do
		user = create(:user)
		article = create(:article, user: user)
		sign_in_as user
		click_on 'Create an Article'
		fill_in 'Description', with: article.description
		fill_in 'Link', with: article.link
		click_button 'Create Article'

		expect(page).to have_content 'article created'
	end
end
