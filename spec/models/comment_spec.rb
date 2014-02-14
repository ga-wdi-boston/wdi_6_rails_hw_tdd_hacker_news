require 'spec_helper'

describe Comment do
  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :submission }
  end
end
