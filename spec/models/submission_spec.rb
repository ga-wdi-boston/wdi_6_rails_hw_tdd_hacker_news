require 'spec_helper'

describe Submission do
  it 'is invalid without a title' do
    expect(Submission.create(link: 'example.com', description: 'This is an interesting article')).to_not be_valid
  end

  it 'is invalid without a link' do
    expect(Submission.create(title: 'Title', description: 'This is an interesting article')).to_not be_valid
  end

  it 'is invalid without a description' do
    expect(Submission.create(title: 'Title', link: 'link.com')).to_not be_valid
  end

  describe "associations" do
    it { should belong_to :user }
    it { should have_many :comments }
  end
end
