class Submission < ActiveRecord::Base
	validates  :title, presence: true
end