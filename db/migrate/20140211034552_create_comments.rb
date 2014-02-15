class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :submission, index: true
      t.text :body
    end
  end
end
