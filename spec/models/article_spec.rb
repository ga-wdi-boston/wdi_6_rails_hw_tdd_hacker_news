require 'spec_helper'

describe Article do

	it 'is invalid without a title' do
		expect(Article.create(url: 'www.google.com', description: 'Hey yo its your boy da article')).to_not be_valid
	end

	it 'is invalid without a url' do
		expect(Article.create(title: 'Google', description: 'Hey yo its your boy da article')).to_not be_valid
	end



end
