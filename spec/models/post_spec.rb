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
	before :each do
		@post = Post.create(description: 'A new post', link: 'http://www.google.com')
	end
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a description' do
  	expect(@post).to be_valid
  	expect(Post.create(link: 'http://www.google.com')).to_not be_valid
  end

  it 'has a link' do
  	expect(@post).to be_valid
  	expect(Post.create(description: 'A new post')).to_not be_valid
  end
end
