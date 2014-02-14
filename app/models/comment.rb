class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable

  validates :body, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true

   def count_votes
  	self.votes.where(direction: true).count - self.votes.where(direction: false).count
  end
end
