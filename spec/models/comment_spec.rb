# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  article_id :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require 'spec_helper'

describe Comment do
  it { should belong_to :article }

  describe 'validations' do

    it 'is valid with content' do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it 'is invalid without content' do
      comment = build(:comment, content: nil)
      expect(comment).to_not be_valid
    end
  end
end
