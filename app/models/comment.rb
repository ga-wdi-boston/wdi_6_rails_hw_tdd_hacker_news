# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  title      :text
#  user_id    :integer
#  article_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
end
