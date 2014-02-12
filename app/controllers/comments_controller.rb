class CommentsController < ApplicationController

  def index
    @submission = Submission.find(params[:submission_id])
    @comments = @submission.comments
  end

  def new
    @comment = Comment.new
    @submission = Submission.find(params[:submission_id])
    @user = current_user
  end

  def create
    @submission = Submission.find(params[:submission_id])
    @submission.comments << Comment.create(comment_params)
    current_user.comments << Comment.create(comment_params)
    redirect_to submission_comments_path(@submission.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :submission_id, :user_id)
  end
end
