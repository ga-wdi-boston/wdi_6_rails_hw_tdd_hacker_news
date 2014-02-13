class CommentsController < ApplicationController

	def index
	end

	def new
		@submission = Submission.find(params[:submission_id])
		@comment = Comment.new
	end

	def create
		@comment = Comment.create(comment_params)
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
		params(:comment).require(:body, :user_id, :submission_id)
	end