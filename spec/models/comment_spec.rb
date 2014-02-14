require 'spec_helper'

describe Comment do
  describe 'validation' do
  	it { should validate_presence_of(:body) }
  	it { should validate_presence_of(:post_id) }
  	it { should validate_presence_of(:user_id) }
  end

  describe 'association' do
  	it { should belong_to(:user) }
  	it { should belong_to(:post) }
  end
end
