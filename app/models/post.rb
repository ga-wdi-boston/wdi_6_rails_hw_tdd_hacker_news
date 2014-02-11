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
end
