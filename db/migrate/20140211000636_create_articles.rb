class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :blurb
      t.text :content
      t.references :user, index: true
      t.references :comments, index: true

      t.timestamps
    end
  end
end
