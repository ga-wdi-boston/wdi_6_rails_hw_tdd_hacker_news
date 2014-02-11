require 'spec_helper'

feature 'User adds comment' do
	background do
		@user = create(:user)
		sign_in_as(@user)
		@article = create(:article)

	end

	scenario 'successfully' do
		visit article_path(@article)
		click_on 'Add comment'
		fill_in 'Body', with: 'New comment text'
		click_on 'Submit comment'

		expect(page).to have_content 'New comment text'
	end

end