class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		# count_votes(@post)
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = 'Post created!'
			redirect_to action: :index
		else
			render :new
		end
	end

	private

	def post_params
		params.require(:post).permit(:description, :link, :user_id)
	end
end
