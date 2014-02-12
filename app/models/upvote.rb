class Upvote < ActiveRecord::Base
	belongs_to :user
	belongs_to :upvotable, polymorphic: true
	validates :user_id, uniqueness: { scope: [:upvotable_id, :upvotable_type] }, presence: true

end
