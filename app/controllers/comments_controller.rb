class CommentsController < ActionController::Base
  def index
    @comments = Comment.all
  end
  def new
    @comment = Comment.new
  end
end
