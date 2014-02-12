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
end
