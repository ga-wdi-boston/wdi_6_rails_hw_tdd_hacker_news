class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :title, presence: true
	validates :url, presence: true
	validates :user_id, presence: true

	def up_vote
		self.increment! :points
	end

end
