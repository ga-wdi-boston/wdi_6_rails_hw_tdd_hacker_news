require 'spec_helper'

describe Comment do
  describe 'associations' do
  	it { should belong_to :article }
  end
end
