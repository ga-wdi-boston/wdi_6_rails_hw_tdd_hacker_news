require 'spec_helper'

describe Comment do
  describe 'associations' do
  	it { should belong_to :article }
  end

  describe 'validations' do
		it 'should be invalid if no body present' do
			expect(Comment.create).to_not be_valid
		end
	end
end
