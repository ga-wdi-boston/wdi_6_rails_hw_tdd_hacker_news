class UpvotesController < ApplicationController
	before_action :set_upvotable

	def vote
		if current_user.upvotes.where(upvotable_id: @upvotable.id, upvotable_type: @upvotable.class.name).present?
			@upvote = current_user.upvotes.find_by(upvotable_id: @upvotable.id, upvotable_type: @upvotable.class.name)
		else
			@upvote = @upvotable.upvotes.new(user_id: current_user.id)
		end

		@upvote.vote = params[:data][:vote]
		@upvote.save!

		redirect_to :back


	end

	private

		def set_upvotable
      @upvotable = params[:upvotable].classify.constantize.find(upvotable_id)
    end

    def upvotable_id
      params[(params[:upvotable] + "_id").to_sym]
    end

    def upvote_params
      params.require(:vote).permit(:vote)
    end

end
