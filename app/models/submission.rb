# == Schema Information
#
# Table name: submissions
#
#  id         :integer          not null, primary key
#  url        :text
#  title      :text
#  user_id    :integer
#  text_block :text
#

class Submission < ActiveRecord::Base
	has_many :comments
	has_many :votes, as: :votable
	belongs_to :user

	validates  :title, presence: true
	validates  :url, presence: true, if: "text_block == nil"
	validates  :user_id, presence: true
end
