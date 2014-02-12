class AddForeignkeysToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true
    add_reference :comments, :submission, index: true
  end
end
