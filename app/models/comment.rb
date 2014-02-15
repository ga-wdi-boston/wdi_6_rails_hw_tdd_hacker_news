# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  submission_id :integer
#  body          :text
#

class Comment < ActiveRecord::Base
	has_many :votes, as: :votable
	belongs_to :submissions

	validates :body, presence: true
	validates :submission_id, presence: true
end
