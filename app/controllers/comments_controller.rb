class CommentsController < ApplicationController
	before_action :get_article

  def index
  	@comment = Comment.new
  	@comments = @article.comments
  end

  def show

  end

  def new
  end

  def create
  	@comment = @article.comments.new(comment_params)
  	@comment.assign_attributes(user: current_user)
  	if @comment.save
  		redirect_to [@article, :comments]
  	else
  		redirect_to root_path
  	end
  	# if !(params.has_key?(:content))
  	# 	flash['alert'] = "Please try again."
  	# 	redirect_to comments_path
  	# elsif comment.save
  	# 	redirect_to articles_path
  	# else
  	# 	redirect_to root_path
  	# end
  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
  end

  def get_article
  	@article = Article.find(params[:article_id])
  end
end
