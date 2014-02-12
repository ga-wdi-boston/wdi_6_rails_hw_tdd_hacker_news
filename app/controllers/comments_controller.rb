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
		@comment = Comment.create(comment_params)
		redirect_to post_comments_path
	end

	private

	def comment_params
		# need to include [:comment] because it's a nested model
		params[:comment][:user_id] = current_user.id
		params[:comment][:post_id] = params[:post_id]
		params.require(:comment).permit(:body, :post_id, :user_id)
	end
end
