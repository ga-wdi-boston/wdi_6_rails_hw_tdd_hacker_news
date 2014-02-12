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
#

class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
end
