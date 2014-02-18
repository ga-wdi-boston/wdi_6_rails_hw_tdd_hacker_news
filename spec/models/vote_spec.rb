require 'spec_helper'

describe Vote do
	describe "associations" do
		it { belong_to :votable }
	end
end
