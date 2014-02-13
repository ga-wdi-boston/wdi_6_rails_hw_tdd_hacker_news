class CommentsController < ApplicationController

	def index
	end

	def new
		@submission = Submission.find(params[:submission_id])
		@comment = Comment.new
	end

	def create
	end

end

private

	def comment_params
		params(:comment).require(:body, :user_id, :submission_id)
	end