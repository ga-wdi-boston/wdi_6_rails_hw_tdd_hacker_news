class PostsController < ApplicationController
	def index
		@posts = Post.all
		@posts.sort_by { |post| post.count_votes}.reverse!
	end

	def new
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
		params.require(:post).permit(:description, :link, :user_id)
	end
end
