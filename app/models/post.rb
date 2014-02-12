class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :link, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
