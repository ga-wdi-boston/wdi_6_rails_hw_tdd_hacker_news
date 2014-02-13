# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  user_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :body, presence: true
  has_many :upvotes, as: :upvotable

  def count_votes
		(self.upvotes.where(vote: true).count) - (self.upvotes.where(vote: false).count)
	end

end
