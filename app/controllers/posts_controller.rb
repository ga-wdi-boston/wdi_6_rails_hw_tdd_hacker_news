class PostsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]

	def index
		@posts = Post.includes(:user).order(created_at: :desc)

	end

	def new
		@post = Post.new
	end

	def show
		redirect_to posts_path
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
        flash[:success] = "Your item has been saved"
        redirect_to root_path
    else
    		flash[:msg] = "You need to specify an article or a link, or both"
		    redirect_to :back
    end
    
	end

	def post_params
    params.require(:post).permit(:title, :links, :article)
  end

end
