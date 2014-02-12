class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.boolean :direction
      t.string :votable_type
      t.integer :votable_id
    end
  end
end
