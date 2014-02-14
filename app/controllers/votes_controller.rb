class VotesController < ApplicationController
	before_action :set_votable
	before_action :authenticate_user!

	def upvote
		vote = Vote.new(direction: true, user_id: current_user.id)

		# if the vote is successfully saved & shoveled...
		if @votable.votes << vote
			# then show confirmation and redirect to the same page you were at
			flash[:notice] = "Vote submitted!"
			redirect_to :back
		else
			# else show error and redirect to the same page you were at
			flash[:alert] = "You've already voted."
			redirect_to :back
		end

	end

	def downvote
		vote = Vote.new(direction: false, user_id: current_user.id)

		# if the vote is successfully saved & shoveled...
		if @votable.votes << vote
			# then gray out button in erb and redirect to the same page
			redirect_to :back
		else
			# i don't think this would ever be triggered, but just in case
			flash[:alert] = "You can't do that."
			redirect_to :back
		end
	end

	def delete
		vote = Vote.where(user_id: current_user.id, votable_id: votable_id, votable_type: params[:votable].to_s.camelcase)
		vote.first.destroy!
		redirect_to :back
	end

	private

	def set_votable
		# gives us @votable in methods above, representing Comment or Post
	  @votable = params[:votable].to_s.classify.constantize.find(votable_id)
	end

	def votable_id
		# makes votable_id searchable by turning it into a symbol
	  params[(params[:votable].to_s + "_id").to_sym]
	end

end
