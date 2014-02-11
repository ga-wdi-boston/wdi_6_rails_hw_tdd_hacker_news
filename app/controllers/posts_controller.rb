class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@user = User.find(params[:user_id])
		@post = Post.new
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
		params.require(:post).permit(:description, :link)
	end
end
