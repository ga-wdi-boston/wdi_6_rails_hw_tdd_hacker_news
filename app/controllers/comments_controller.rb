class CommentsController < ApplicationController
	def index
		@post = Post.find(params[:post_id])
		@comments = @post.comments.sort_by { |comment| comment.count_votes}.reverse!
	end

	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)

		if @comment.save
			@post.comments << @comment
			flash[:notice] = 'Comment posted'
			redirect_to post_comments_path(@comment.post)
		else
			render :new
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :user_id, :post_id)
	end
end
