class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article, dependent:  :destroy
  has_many :votes, as: :votable
  validates :content, presence: true
end
