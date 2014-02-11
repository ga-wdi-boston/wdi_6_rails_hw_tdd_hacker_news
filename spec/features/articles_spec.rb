require 'spec_helper'

feature 'Manage Articles' do

  background do
    @article1 = create(:article)
    @article2 = create(:article)
    @article3 = create(:article)
  end

  scenario 'View all article titles that are links to an ext webpage' do
    visit root_path
    expect(page).to have_content @article1.title
  end

end
