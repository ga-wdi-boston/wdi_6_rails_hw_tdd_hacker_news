# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  article_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Comment do

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:article_id) }
    it { should validate_presence_of(:body) }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :article }
  end

end
