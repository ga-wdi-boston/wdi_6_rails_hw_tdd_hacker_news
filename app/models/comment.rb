class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  has_many :votes, as: :votable

  validates :body, presence: true

   def vote_tally
  	up_votes = votes.where(vote: true).count
  	down_votes = votes.where(vote: false).count
  	up_votes - down_votes
  end
end
