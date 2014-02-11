class AddTextBlockToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :text_block, :text
  end
end
