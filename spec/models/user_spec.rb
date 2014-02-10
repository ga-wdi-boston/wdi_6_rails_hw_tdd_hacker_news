require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  describe "associations" do
  	it { have_many :articles }
  	it { have_many :comments }
  end
end
