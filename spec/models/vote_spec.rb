require 'spec_helper'

describe User do
  describe "associations" do
  	it { belong_to :user }
  	it { belong_to :votable }
  end
end
