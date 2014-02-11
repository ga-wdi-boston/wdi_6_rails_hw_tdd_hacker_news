class Post < ActiveRecord::Base
  belongs_to :user
  validates :link, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
