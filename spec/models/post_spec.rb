require 'spec_helper'

describe Post do
  describe 'association' do
    it { should belong_to :user }
    it { should have_many :comments}
  end

  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end
  
end

