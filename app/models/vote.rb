# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  direction    :boolean
#  votable_id   :integer
#  votable_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user
  validates :user_id, uniqueness: { scope: [:votable_type, :votable_id]}, presence: true
  after_save :count_votes

  def count_votes
    up_votes = votable.votes.where(direction: true).count
    down_votes = votable.votes.where(direction: false).count
    total = up_votes - down_votes
    votable.update_attributes(votes_count: total)
  end
end
