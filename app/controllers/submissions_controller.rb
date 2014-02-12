class SubmissionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :get_user
  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
  end

  def create
    @user.submissions << Submission.create(submission_params)
    redirect_to submissions_path
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :link, :description, :user_id)
  end

  def get_user
    @user = current_user
  end

end
