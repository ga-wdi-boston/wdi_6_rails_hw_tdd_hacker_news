class CommentsController < ApplicationController
before_action :set_article

	def index
		@comments = Article.find(params[:article_id]).comments { |x,y|
			x.votes.select { |vote| vote.direction === true }.count <=> y.votes.select { |vote| vote.direction === false }.count
		}.reverse
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = @article.comments.new(comment_params)
    @comment.assign_attributes(user: current_user)
		if @comment.save
			respond_to do |format|
      	format.html { redirect_to [@article, :comments], notice: 'comment was successfully created.'}
      end
		else
			redirect_to [@article, :comments]
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_article
    @article = Article.find(params[:article_id])
  end
end




