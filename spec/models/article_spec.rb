# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  title          :text
#  url            :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  text           :text
#  user_id        :integer
#  comments_count :integer
#  votes_count    :integer          default(0)
#

require 'spec_helper'

describe Article do
  it { should belong_to :user }
  it { should have_many :comments }


  describe 'validations' do
    it 'is invalid without a proper url' do
      invalid_article = build(:article, url: 'thisisbad', text: nil)
      expect(invalid_article).to_not be_valid
    end

    it 'is invalid without either a text or url' do
      invalid_no_url = build(:article, url: nil, text: nil)
      valid_url = build(:article, text: nil)
      valid_text = build(:article, url: nil)

      expect(invalid_no_url).to_not be_valid
      expect(valid_url).to be_valid
      expect(valid_text).to be_valid
    end
  end

  describe '#count_votes' do
    before :each do
      @user = create(:user)
      @article = create(:article)
    end

    it 'returns 1 when there is one up votes' do
      create(:article_vote, user: @user, direction: true, votable: @article)
      expect(@article.votes_count).to eq 1
    end

    it 'returns -1 when there is one down votes' do
      create(:article_vote, user: @user, direction: false, votable: @article)
      expect(@article.votes_count).to eq -1
    end
  end
end
