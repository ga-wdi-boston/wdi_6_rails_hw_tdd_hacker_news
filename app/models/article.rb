class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :votes, as: :votable

	validates :title, presence: true
	validates :url, presence: true
	validates :user_id, presence: true

	def get_votes
  	self.votes.where(up: true).count - self.votes.where(up: false).count
  end

end
