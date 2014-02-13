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

	describe '.get_votes' do

		before do
			user = create(:user)
			@article = create(:article)
		end

		it 'returns a count of up votes for an object' do
			@article.votes << create(:vote)
			expect(@article.get_votes).to eq 1
		end

	end


end
