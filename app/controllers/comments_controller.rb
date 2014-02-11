class CommentsController < ApplicationController
	def index
		@post = Post.find(params[:post_id])
		@comment = @post.comments
	end

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice] = 'Comment posted'
			redirect_to post_path(@comment.post_id)
		else
			render :new
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :user_id, :post_id)
	end
end
