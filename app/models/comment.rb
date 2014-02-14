# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  article_id  :integer
#  content     :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  votes_count :integer          default(0)
#

class Comment < ActiveRecord::Base
  belongs_to :article, counter_cache: true
  belongs_to :user
  has_many :votes, as: :votable
  validates :content, presence: true

end
