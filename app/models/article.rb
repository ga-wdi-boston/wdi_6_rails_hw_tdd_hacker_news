# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :text
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  text       :text
#  user_id    :integer
#
class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  def count_votes
    up_votes = votes.where(direction: true).count
    down_votes = votes.where(direction: false).count
    up_votes - down_votes
  end
end
