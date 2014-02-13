require 'spec_helper'


describe Article do
  describe "associations" do
  	it { have_many :comments }
  	it { belong_to :user }
  end

  it "is valid with title, blurb, url " do
  	expect(Article.create(title:"Batman",blurb:"Batman!",url:"https://www.google.com/")).to be_valid
  end

  it "is invalid with incorrect url" do
  	expect(Article.create(title:"Batman",url:"//www.google.com/")).to_not be_valid
  end

  it "is invalid with without title" do
  	expect(Article.create(blurb:"Batman!",url:"//www.google.com/")).to_not be_valid
  end

  it "is valid with without blurb" do
  	expect(Article.create(title:"Batman", url:"https://www.google.com/")).to be_valid
  end

   it "is valid with without url" do
  	expect(Article.create(title:"Batman", blurb:"Nananananana")).to be_valid
  end

# note - should test the invalid - or not-happy path
# also should check the the url is a real one
end
