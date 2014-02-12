class CommentsController < ApplicationController
	before_action :get_post
	def index
		@post = Post.find(params[:post_id])
		@comments = @post.comments
	end

	def new
		@comment = Comment.new

	end

	def create
		comment = Comment.create!(comments_params)
		current_user.comments << comment
    @post.comments << comment
    redirect_to post_comments_path(@post.id)    
  end


	private

	def comments_params
    params.require(:comment).permit(:comment)
  end

	def get_post
    @post = Post.find(params[:post_id]) if params.key?(:post_id)
  end
end
