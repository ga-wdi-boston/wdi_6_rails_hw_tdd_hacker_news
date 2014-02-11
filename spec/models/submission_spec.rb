require 'spec_helper'

describe Submission do
  it 'is invalid without a title' do
    expect(Submission.create(link: 'example.com', description: 'This is an interesting article')).to_not be_valid
  end
end
