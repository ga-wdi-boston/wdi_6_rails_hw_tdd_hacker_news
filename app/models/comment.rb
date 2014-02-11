# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  submission_id :integer
#  body          :text
#

class Comment < ActiveRecord::Base
	belongs_to :submissions
end
