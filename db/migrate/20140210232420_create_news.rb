class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :title
      t.text :links
      t.references :user, index: true

      t.timestamps
    end
  end
end
