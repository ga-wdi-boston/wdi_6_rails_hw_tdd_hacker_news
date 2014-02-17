class PostsController < ApplicationController
	require "addressable/uri"

	def index
		@posts = Post.all.includes(:user)
		@posts.sort_by { |post| post.count_votes}.reverse!
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		link = Addressable::URI.parse(@post.link)
		if link.scheme == nil || link.host == nil
			flash[:notice] = "Invalid email.\nNote: email must take the form http://www.example.com"
			render :new
		elsif @post.save
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
