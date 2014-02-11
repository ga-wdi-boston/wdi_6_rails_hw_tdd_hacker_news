class Submission < ActiveRecord::Base
	validates  :title, presence: true
	validates  :url, presence: true, if: "text_block.nil?"
	validates  :user_id, presence: true
end