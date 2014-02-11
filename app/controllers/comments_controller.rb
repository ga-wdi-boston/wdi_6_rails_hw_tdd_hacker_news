class CommentsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show, :new]

	def index
		@comments = Comment.all
	end

	def new
			@comment = Comment.new
		end

		def create
			@comment = Comment.new(comment_params)
			@comment.save
			if @comment.save
				redirect_to  articles_path
			else
				render :new
			end
		end

		private

		def comment_params
			params.require(:comment).permit(:content)
		end
end
