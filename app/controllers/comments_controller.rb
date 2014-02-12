class CommentsController < ApplicationController

	before_action :get_article, only: [:new, :create]

	def new
		@article = Article.find(params[:article_id])
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.article_id = params[:article_id]

		if @comment.save
			flash[:notice] = 'Comment submitted'
			redirect_to article_path(@article)
		else
			flash.now[:error] = @comment.errors.full_messages.join(', ')
			render :new
		end

	end


	private

	def get_article
		@article = Article.find(params[:article_id])
	end

	def comment_params
		params.require(:comment).permit(:body)
	end

end