class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :description
      t.text :link
      t.integer :votes
      t.references :user, index: true

      t.timestamps
    end
  end
end
