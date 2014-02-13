class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :votes, as: :votable

  belongs_to :parent, class_name: "Comment"
  has_many :sub_comments, class_name: "Comment", foreign_key: "sub_comment_id"

  validates :body, presence: true
  validates :article_id, presence: true
  validates :user_id, presence: true

  def get_votes
  	self.votes.where(up: true).count
  end

end
