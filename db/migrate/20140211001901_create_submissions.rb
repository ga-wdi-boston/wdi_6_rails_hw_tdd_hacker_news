class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :url
      t.text :title
      t.references :user, index: true
    end
  end
end
