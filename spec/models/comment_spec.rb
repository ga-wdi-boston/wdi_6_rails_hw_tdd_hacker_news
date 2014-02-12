require 'spec_helper'

describe Comment do
	it 'is invalid without a body' do
	expect(Comment.create).to_not be_valid
end

	it 'is invalid without a submission id' do
	expect(Comment.create(body: 'Good story')).to_not be_valid
end
end