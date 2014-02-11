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

require 'spec_helper'

describe Post do
  # pending "add some examples to (or delete) #{__FILE__}"
end
