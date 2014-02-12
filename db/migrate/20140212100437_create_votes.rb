class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :direction
      t.integer :votable_id
      t.string :votable_type
      t.references :user, index: true

      t.timestamps
    end
  end
end
