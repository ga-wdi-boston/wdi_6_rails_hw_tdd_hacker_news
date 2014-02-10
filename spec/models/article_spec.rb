require 'spec_helper'

describe Article do

	describe 'associations' do
		it { should belong_to :user}
	end

	describe 'validations' do
		it 'should be invalid if no user_id present' do
			expect(Article.create(title: 'Article', url: 'www.article.com')).to_not be_valid
			expect(Article.create(title: 'Article', user_id: 1)).to_not be_valid
			expect(Article.create(user_id: 1, url: 'www.article.com')).to_not be_valid
		end
	end


end
