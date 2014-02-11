require 'spec_helper'

describe Post do
  describe 'validation' do
  	it { should validate_presence_of(:link) }
  	it { should validate_presence_of(:description) }
  	it { should validate_presence_of(:user_id) }
  end
end
