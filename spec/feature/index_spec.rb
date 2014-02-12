require 'spec_helper'

feature "homepage" do 

	before :each do
		Post.create(title: "Chris", links: "Clearfield")
		Post.create(title: "David", links: "Fisher")
		
	end

	scenario 'home page should have all posts' do
  		visit '/'
  		expect(page).to have_content("Chris")
  		expect(page).to have_content("David")
  	end

end
