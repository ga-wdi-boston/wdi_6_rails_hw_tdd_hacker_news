# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  user_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Comment do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
  	before :each do
  		@comment = Comment.create(body: 'This is the comment test body', post_id: 1, user_id: 82)
  	end
  	it 'has a body' do
    	expect(@comment).to be_valid
    	expect(Comment.create(post_id: 1, user_id: 82)).to_not be_valid
    end

    it 'has a post_id' do
    	expect(@comment).to be_valid
    	expect(Comment.create(body: 'A new comment body', user_id: 82)).to_not be_valid
    end

    it 'has a user id' do
      expect(@comment).to be_valid
      expect(Comment.create(body: 'A new comment body', post_id: 1)).to_not be_valid
    end
  end
end
