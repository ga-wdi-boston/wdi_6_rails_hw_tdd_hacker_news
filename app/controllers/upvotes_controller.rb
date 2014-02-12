class UpvotesController < ApplicationController
	before_action :set_upvotable

	def vote
		@upvote = @upvotable.upvotes.new(vote: true, user_id: current_user.id)
		if @upvote.save
			flash[:notice] = 'Vote created'
			redirect_to root_path
		else
			flash[:error] = 'You already voted'
			redirect_to root_path
		end
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
