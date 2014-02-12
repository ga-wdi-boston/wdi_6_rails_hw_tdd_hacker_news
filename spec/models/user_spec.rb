require 'spec_helper'

describe User do
	describe 'associations' do
  	it { should have_many(:posts) }
  end
  describe 'associations' do
  	it { should have_many(:comments)}
  end

  #pending "add some examples to (or delete) #{__FILE__}"
end
