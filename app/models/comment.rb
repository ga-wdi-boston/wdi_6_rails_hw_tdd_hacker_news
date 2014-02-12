class Comment < ActiveRecord::Base
  belongs_to :user
  # delegate :user, to: :post, allow_nil: false
  belongs_to :post
  validates :body, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true
end
