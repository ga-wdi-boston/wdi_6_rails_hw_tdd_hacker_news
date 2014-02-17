class ChangeUpvotesOnPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :upvotes, :integer, default: 1
  end
end
