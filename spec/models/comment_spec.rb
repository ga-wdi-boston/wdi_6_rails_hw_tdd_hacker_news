# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  title      :text
#  user_id    :integer
#  article_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Comment do

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :article }
  end

end
