require 'spec_helper'

feature 'Visitor views article comments' do
	background do
		user = create(:user)
		sign_in_as(user)
		@article = create(:article)

	end

	scenario 'successfully' do
		visit root_path
		expect(page).to have_link "#{@article.title}"
	end

end