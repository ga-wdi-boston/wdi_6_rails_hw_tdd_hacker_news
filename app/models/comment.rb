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

class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  def count_votes
    up_votes = votes.where(direction: true).count
    down_votes = votes.where(direction: false).count
    up_votes - down_votes
  end
end
