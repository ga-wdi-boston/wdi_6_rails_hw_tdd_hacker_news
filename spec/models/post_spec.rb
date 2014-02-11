# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  description :text
#  link        :text
#  upvotes     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

require 'spec_helper'

describe Post do

  describe 'validations' do
  	before :each do
  		@post = Post.create(description: 'A new post', link: 'http://www.google.com', user_id: 82)
  	end
    # pending "add some examples to (or delete) #{__FILE__}"
    it 'has a description' do
    	expect(@post).to be_valid
    	expect(Post.create(link: 'http://www.google.com', user_id: 82)).to_not be_valid
    end

    it 'has a link' do
    	expect(@post).to be_valid
    	expect(Post.create(description: 'A new post', user_id: 82)).to_not be_valid
    end

    it 'has a user id' do
      expect(@post).to be_valid
      expect(Post.create(description: 'A new post', link: 'http://www.google.com')).to_not be_valid
    end
  end
end
