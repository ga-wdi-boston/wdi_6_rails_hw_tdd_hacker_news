class RemoveContentFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :content, :text
  end
end
