class CommentsController < ApplicationController
  before_action :set_article

  def index
    @comments = @article.comments.sort! { |a, b| b.votes_count <=> a.votes_count }
  end

  def create
    @comment = @article.comments.new(comment_params)
    @comment.assign_attributes(user: current_user)
    if @comment.save
      flash[:notice] = 'Comment saved!'
      redirect_to [@article, :comments]
    else
      flash[:errors] = @comment.errors.full_messages.join(', ')
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
