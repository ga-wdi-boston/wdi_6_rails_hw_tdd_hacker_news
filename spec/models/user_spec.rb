require 'spec_helper'

describe User do
	describe 'relationships' do
	  it { should have_many :posts }
	  it { should have_many :comments }
	end
end
