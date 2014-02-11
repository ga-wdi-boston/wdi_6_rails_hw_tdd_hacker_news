class Submission < ActiveRecord::Base
	has_many :comments
	belongs_to :user

	validates  :title, presence: true
	validates  :url, presence: true, if: "text_block.nil?"
	validates  :user_id, presence: true
end