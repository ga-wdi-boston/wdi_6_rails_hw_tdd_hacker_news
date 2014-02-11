class PostsController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :authenticate_user!, only: [:index, :new]

	def index
		# @posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
	end


end
