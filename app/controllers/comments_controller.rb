class CommentsController < ApplicationController

	def index
	end

	def new
		@comment = Comment.new
		@submission = Submission.find(params[:id])
	end

	def create
	end

end

private

	def comment_params
		params(:comment).require(:body, :user_id, :id)
	end