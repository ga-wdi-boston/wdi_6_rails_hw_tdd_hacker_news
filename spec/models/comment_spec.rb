require 'spec_helper'

describe Comment do
  describe 'associations' do
  	it { should belong_to :article }
  end

  describe 'validations' do
		it 'should be invalid if no body present' do
			expect(Comment.create).to_not be_valid
		end

		it 'should be invalid if no article_id present' do
			expect(Comment.create(body: 'Test comment', user_id: 1)).to_not be_valid
		end

		it 'should be invalid if no user_id present' do
			expect(Comment.create(body: 'Test comment', article_id: 1)).to_not be_valid
		end
	end

	describe '.get_votes' do

		before do
			user = create(:user)
			article = create(:article)
			@comment = create(:comment)

		end

		it 'returns a count of up votes for an object' do
			@comment.votes << create(:vote) << create(:vote)
			expect(@comment.get_votes).to eq 2

			@comment.votes << create(:vote, up: false)
			expect(@comment.get_votes).to eq 1

		end


	end

end
