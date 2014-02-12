class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission
  has_many :votes, as: :votable
end
