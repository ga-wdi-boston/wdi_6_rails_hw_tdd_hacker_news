class AddUserIdToUpvotes < ActiveRecord::Migration
  def change
    add_reference :upvotes, :user, index: true
  end
end
