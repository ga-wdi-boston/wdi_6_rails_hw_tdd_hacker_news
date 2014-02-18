require 'spec_helper'

describe User do

	describe "associations" do
		it { have_many :articles }
		it { have_many :comments}
	end

	it "is invalid without an email" do
		expect(User.create(password: 'asdfasdf')).to_not be_valid
	end

	it "is invalid without a password" do
		expect(User.create(email: 'sue@email.com')).to_not be_valid
	end
end
