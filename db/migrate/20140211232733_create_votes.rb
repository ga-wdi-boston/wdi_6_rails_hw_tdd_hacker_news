class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :direction
			t.belongs_to :voteable, polymorphic: true, index: true
			t.references :user, index: true
      t.timestamps
    end
  end
end
