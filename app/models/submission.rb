class Submission < ActiveRecord::Base
	validates  :title, presence: true
	validates  :url, presence: true, if: "text_block.nil?"
end