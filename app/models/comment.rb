class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :votes, as: :votable

  def get_votes
  	self.votes.where(up: true).count
  end

end
