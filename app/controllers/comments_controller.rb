class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_submission

  def index
    @comments = @submission.comments
  end

  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    @comment = @submission.comments.new(comment_params)
    @comment.assign_attributes(user: current_user)
    if @comment.save
      flash[:notice] = 'Comment added!'
      redirect_to [@submission]
    else
      flash[:errors] = @comment.errors.full_messages.join(', ')
      redirect_to [@submission]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def get_submission
    @submission = Submission.find(params[:submission_id])
  end
end
