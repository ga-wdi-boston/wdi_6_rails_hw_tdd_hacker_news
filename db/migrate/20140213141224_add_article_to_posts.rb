class AddArticleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :article, :text
  end
end
