class CommentsController < ActionController::Base

	def index
	end

	def new
		@comment = Comment.new
		@submission = Submission.find(params[:id])
	end

	def create

	end

end