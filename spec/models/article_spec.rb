require 'spec_helper'

describe Article do

	describe 'associations' do
		it { should belong_to :user}
		it { should have_many :comments}

	end

	describe 'validations' do
		it 'should be invalid if no user_id present' do
			expect(Article.create(title: 'Article', url: 'www.article.com')).to_not be_valid
			expect(Article.create(title: 'Article', user_id: 1)).to_not be_valid
			expect(Article.create(user_id: 1, url: 'www.article.com')).to_not be_valid
		end
	end

	describe '.up_vote' do
		it 'adds 1 point to article attribute when invoked' do
			@article = Article.create(title: 'Article', url: 'www.article.com', user_id: 1)
			expect(@article.points).to eq 0

			@article.up_vote
			expect(@article.points).to eq 1

		end

	end


end
