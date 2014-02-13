class AddDetailsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :upvotes, :integer, default: 0
    add_column :posts, :link, :text
  end
end
