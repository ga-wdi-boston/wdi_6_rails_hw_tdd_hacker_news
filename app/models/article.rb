class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :description, presence: true
  validates :link, presence: true

  def vote_tally
  	up_votes = votes.where(vote: true).count
  	down_votes = votes.where(vote: false).count
  	up_votes - down_votes
  end
end
