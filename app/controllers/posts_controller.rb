class PostsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		redirect_to posts_path
	end

	def create
		@post = Post.new(post_params)
		@post.save!
    redirect_to posts_path
	end

	def post_params
    params.require(:post).permit(:title, :links)
  end

end
