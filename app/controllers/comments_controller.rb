class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create]
	# if there is no user logged in, the create action doesn't run at all, because it runs authenticate_user! which returns false so create doesn't run

	def index
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		if user_signed_in?
			@user = current_user
		end
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice] = "Your comment has been submitted!"
			redirect_to post_comments_path
		else
			flash[:alert] = @comment.errors.full_messages.join(', ')
			render :index
		end
	end

	private

	def comment_params
		# need to include [:comment] because it's a nested model
		params[:comment][:user_id] = current_user.id
		params[:comment][:post_id] = params[:post_id]
		params.require(:comment).permit(:body, :post_id, :user_id)
	end
end
