class VotesController < ApplicationController
	before_action :set_votable

	def create
	end

	def destroy
	end

	private

	def set_votable
		# makes :votable searchable, e.g. Comment or Post
	  @votable = params[:votable].classify.constantize.find(votable_id)
	end

	def votable_id
		# makes votable_id searchable by turning it into a symbol
	  params[(params[:votable] + "_id").to_sym]
	end

end
