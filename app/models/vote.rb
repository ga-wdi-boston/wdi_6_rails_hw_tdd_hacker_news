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
  validates :user_id, uniqueness: { scope: [:votable_type, :votable_id]}, presence: true
end
