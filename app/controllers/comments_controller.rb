class CommentsController < ApplicationController

	before_action :get_article, only: [:new, :create]

	def new
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:comment_id])
		@new_comment = Comment.new
	end

	def create
		if user_signed_in?
			@comment = Comment.new(comment_params)
			@comment.user_id = current_user.id
			@comment.article_id = params[:article_id]
			if params[:comment_id].present?
				@comment.sub_comment_id = params[:comment_id]
			end

			if @comment.save
				flash[:notice] = 'Comment submitted'
				redirect_to article_path(@article)
			else
				flash.now[:error] = @comment.errors.full_messages.join(', ')
				render :new
			end
		else
			flash[:warning] = 'Please sign in or sign up!'
			redirect_to new_user_session_path
		end

	end


	private

	def get_article
		@article = Article.find(params[:article_id])
	end

	def comment_params
		params.require(:comment).permit(:body, :sub_comment_id)
	end

end