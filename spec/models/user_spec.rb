require 'spec_helper'

describe User do
	describe 'associations' do
		it { should have_many :articles }
		it { should have_many :comments }
	end

end
