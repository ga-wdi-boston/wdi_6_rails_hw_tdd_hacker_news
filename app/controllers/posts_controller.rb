class PostsController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :authenticate_user!, only: [:index, :new]

	def index
		@posts = Post.all.sort_by{ |post| post.created_at}
	end

	def new
		if user_signed_in?
			@post = Post.new
		else
			flash[:alert] = "You must be signed in to submit a link."
			redirect_to new_user_session_path
		end
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Your link has been submitted!"
			redirect_to posts_path
		else
			flash.now[:alert] = @post.errors.full_messages.join(', ')
			render :new
		end
	end

	private

	def post_params
		# because i don't have nested routes, the form submission for creating a new post doesn't automatically put user_id in the params hash
		# but i can manually define it using the current_user helper method!
		params[:post][:user_id] = current_user.id
		params.require(:post).permit(:title, :link, :description, :user_id)
	end

end
