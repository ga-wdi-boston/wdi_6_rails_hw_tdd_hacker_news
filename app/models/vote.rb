class Vote < ActiveRecord::Base
	belongs_to :votable, polymorphic: true
	belongs_to :user

	# validations don't work ?
	validates :user_id, uniqueness: { scope: [:votable_type, :votable_id]}
end
