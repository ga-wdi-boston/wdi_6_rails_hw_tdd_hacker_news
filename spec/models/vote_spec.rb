require 'spec_helper'

describe Vote do
	it 'is invalid without a user id' do
	expect(Vote.create(direction: false, votable_type: 'comment', votable_id: 3)).to_not be_valid
end
	it 'is invalid without a direction' do
	expect(Vote.create(user_id: 3, votable_type: 'comment', votable_id: 3)).to_not be_valid
end

	it 'is invalid without a votable type' do
	expect(Vote.create(user_id: 3, direction: true, votable_id: 3)).to_not be_valid
end

	it 'is invalid without a votable id' do
	expect(Vote.create(user_id: 3, votable_type: 'comment', direction: false)).to_not be_valid
end
end