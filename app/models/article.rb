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
  validates :url, presence: true, format: { with: /https?:\/\/.*/, message: 'must be a valid webpage' }, unless: :text?
  validates :title, presence: true
  validates :text, presence: true, unless: :url?

  def count_votes
    up_votes = votes.where(direction: true).length
    down_votes = votes.where(direction: false).length
    up_votes - down_votes
  end

end
