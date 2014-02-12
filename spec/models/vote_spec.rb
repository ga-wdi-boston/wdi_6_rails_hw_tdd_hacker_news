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

require 'spec_helper'

describe Vote do
  # pending "add some examples to (or delete) #{__FILE__}"
end
