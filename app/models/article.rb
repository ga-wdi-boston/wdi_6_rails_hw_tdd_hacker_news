class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :url, presence: true, unless: :blurb?, format: {with: /https?:/}
  validates :title, presence: true
  validates :blurb, presence: true, unless: :url?
end
