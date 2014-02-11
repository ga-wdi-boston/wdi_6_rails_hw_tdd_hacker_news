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
		@post = Post.create!(post_params)
		redirect_to posts_path
	end

	private

	def post_params
		# because i don't have nested routes, the form submission for creating a new post doesn't automatically put user_id in the params hash
		# but i can manually define it using the current_user helper method!
		params[:post][:user_id] = current_user.id
		params.require(:post).permit(:link, :description, :user_id)
	end

end
