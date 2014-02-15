class CommentsController < ApplicationController

	def index
		@submission = Submission.find(params[:submission_id])
		@comments = @submission.comments
	end

	def new
		@submission = Submission.find(params[:submission_id])
		@comment = Comment.new
	end

	def create
		@comment = Comment.create(comment_params)
		@comment.submission_id = params[:submission_id]
		@comment.user_id = current_user.id
			if @comment.save!
				flash[:notice] = 'Created a new comment!'
      	redirect_to submissions_path
    	else
      	flash.now[:errors] = @submission.errors.full_messages
      	render :new
    	end
	end

end

private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def get_submission
		@submission = Submission.find(params[:submission_id])
	end