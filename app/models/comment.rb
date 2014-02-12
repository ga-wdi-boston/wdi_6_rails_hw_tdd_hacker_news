class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable

  validates :body, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true
end
