class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.boolean :vote
      t.belongs_to :upvotable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
