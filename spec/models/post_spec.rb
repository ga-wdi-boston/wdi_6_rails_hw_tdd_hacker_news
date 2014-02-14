require 'spec_helper'

describe Post do

  describe 'validation' do
  	it { should validate_presence_of(:title) }
  	it { should validate_presence_of(:link) }
  	it { should validate_presence_of(:description) }
  	it { should validate_presence_of(:user_id) }
  end

  describe 'association' do
  	it { should belong_to(:user) }
  	it { should have_many(:comments) }
  end

end
