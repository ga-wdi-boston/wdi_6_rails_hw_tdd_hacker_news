class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create]

	def index
		if user_signed_in?
				@user = current_user
		end
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
		elsif user_signed_in? == false
			# this doesn't work yet
			flash[:alert] = "You must be signed in to comment."
			render :index
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
