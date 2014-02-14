class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :title
      t.text :link
      t.text :description

      t.timestamps
    end
  end
end
