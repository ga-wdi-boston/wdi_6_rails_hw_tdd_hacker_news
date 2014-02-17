class AddVoteDefaultToUpvotes < ActiveRecord::Migration
  def change
  	change_column :upvotes, :vote, :boolean, default: false
  end
end
