class VotesController < ApplicationController
	before_action :set_votable

	def vote

		if current_user.votes.where(votable_id: @votable.id).present?
			@vote = current_user.votes.find_by(votable_id: @votable.id)
		else
			@vote = @votable.votes.new(user_id: current_user.id)
		end

		@vote.up = params[:data][:up]
		@vote.save!

		redirect_to root_path

	end

	private

	def set_votable
    @votable = params[:votable].classify.constantize.find(votable_id)
  end

  def votable_id
    params[(params[:votable] + "_id").to_sym]
  end


end