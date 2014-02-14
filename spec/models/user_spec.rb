require 'spec_helper'


describe User do
  describe "associations" do
  	it { have_many :articles }
  	it { have_many :comments }
  end

  it "is invalid without an email or password" do
  	expect(User.create()).to_not be_valid
  end
end
