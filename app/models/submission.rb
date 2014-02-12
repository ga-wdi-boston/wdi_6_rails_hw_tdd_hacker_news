class Submission < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :comments
end
