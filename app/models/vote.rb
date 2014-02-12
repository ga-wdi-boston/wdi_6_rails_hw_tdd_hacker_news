class Vote < ActiveRecord::Base
	validates :voteable_id, :uniqueness =>{scope: [:voteable_type, :user_id]}
  belongs_to :voteable, polymorphic: true
  belongs_to :user
end
