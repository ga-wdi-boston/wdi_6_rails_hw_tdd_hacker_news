class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :restrict_with_error
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :body, presence: true


  # def self.vote_count
  #   up_votes = Vote.where(direction: true).count
  #   down_votes = Vote.where(direction: false).count
  #   up_votes - down_votes
  # end

end
