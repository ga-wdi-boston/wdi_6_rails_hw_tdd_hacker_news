class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :url
      t.references :user
      t.integer :points, :default => 0

      t.timestamps
    end
  end
end
