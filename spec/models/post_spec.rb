require 'spec_helper'

describe Post do
	describe 'associations' do
  	it { should belong_to :user}
  	it { should have_many :comments }
  	it { should have_many :votes}
  end
	
  #pending "add some examples to (or delete) #{__FILE__}"
end
