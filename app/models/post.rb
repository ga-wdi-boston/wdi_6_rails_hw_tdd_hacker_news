class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :link, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
