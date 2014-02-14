class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :link, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  def count_votes
  	self.votes.where(direction: true).count - self.votes.where(direction: false).count
  end

end
