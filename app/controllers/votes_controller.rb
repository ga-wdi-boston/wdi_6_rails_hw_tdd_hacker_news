class VotesController < ApplicationController
	before_action :set_votable
	before_action :authenticate_user!

	def upvote
		# you can only vote on the posts/1/comments page, not on front page (at the moment)
		# binding.pry
		vote = Vote.new(direction: true, user_id: current_user.id)

		# if the vote is successfully saved & shoveled...
		if @votable.votes << vote
			# then show confirmation and redirect to the same page you were at
			flash[:notice] = "Vote submitted!"
			redirect_to post_comments_path
		else
			# else show error and redirect to the same page you were at
			flash[:alert] = "You can't do that!"
			redirect_to post_comments_path
		end

	end

	def downvote
		vote = Vote.new(direction: false, user_id: current_user.id)

		# if the vote is successfully saved & shoveled...
		if @votable.votes << vote
			# then show confirmation and redirect to the same page you were at
			flash[:notice] = "Vote submitted!"
			redirect_to post_comments_path
		else
			# else show error and redirect to the same page you were at
			flash[:alert] = "You can't do that!"
			redirect_to post_comments_path
		end
	end

	def delete_vote

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
