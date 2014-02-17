# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  description :text
#  link        :text
#  upvotes     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :description, presence: true
	validates :link, presence: true
	validates :user_id, presence: true
	has_many :upvotes, as: :upvotable

	def count_votes
		(self.upvotes.where(vote: true).count) - (self.upvotes.where(vote: false).count)
	end

	def count_comments
		self.comments.count
	end
end
