class PostsController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :authenticate_user!, only: [:index, :new]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:link, :description, :user_id)
	end

end
