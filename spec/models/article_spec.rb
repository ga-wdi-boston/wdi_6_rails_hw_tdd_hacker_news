require 'spec_helper'


describe Article do
  describe "associations" do
  	it { have_many :comments }
  	it { belong_to :user }
  end

  it "is valid with title, blurb, content " do
  	expect(Article.create(title:"Batman",blurb:"Batman!",url:"https://www.google.com/")).to be_valid
  end

end
