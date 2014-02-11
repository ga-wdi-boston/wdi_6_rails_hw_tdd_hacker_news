class Comment < ActiveRecord::Base
	belongs_to :submissions
end