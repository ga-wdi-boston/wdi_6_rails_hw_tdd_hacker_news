require 'spec_helper'

feature 'Visitor views all posts on front page' do
	scenario 'successfully' do
		google = create(:google)
		twitter = create(:twitter)
		kiva = create(:kiva)

		visit root_path

		expect(page).to have_content('I can haz search?')
		expect(page).to have_content('Microfinance loans to the developing world')
		expect(page).to have_link('Twitter')
		expect(page).to have_link('Comments')
	end

end
