require 'spec_helper'

describe Comment do
	describe 'associations' do
  	it { should belong_to :post}
  	it { should have_many :votes}
  end
  #pending "add some examples to (or delete) #{__FILE__}"
end
