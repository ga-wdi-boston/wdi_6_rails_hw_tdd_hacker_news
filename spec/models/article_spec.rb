# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :text
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  text       :text
#  user_id    :integer
#

require 'spec_helper'

describe Article do
  it { should belong_to :user }
  it { should have_many :comments }

  describe '#count_votes' do
    before :each do
      @user = create(:user)
      @article = create(:article)
    end

    it 'returns 2 when there are two up votes' do
      @article.votes << create(:vote_up, user_id: @user.id)
      expect(@article.count_votes).to eq 1
    end

    it 'returns -2 when there are two down votes' do
      @article.votes << create(:vote_down, user_id: @user.id)
      expect(@article.count_votes).to eq -1
    end
  end
end
