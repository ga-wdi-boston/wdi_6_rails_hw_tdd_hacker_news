class VotesController < ApplicationController
	before_action :set_votable

	def vote
		if user_signed_in?
			@vote = @votable.votes.find_or_create_by(user_id: current_user.id)
			@vote.up = params[:data][:up]
			@vote.save!

			redirect_to :back
		else
			flash.now[:alert] = 'Please sign in or sign up!'
			redirect_to root_path
		end
	end

	private

	def set_votable
    @votable = params[:votable].classify.constantize.find(votable_id)
  end

  def votable_id
    params[(params[:votable] + "_id").to_sym]
  end

end