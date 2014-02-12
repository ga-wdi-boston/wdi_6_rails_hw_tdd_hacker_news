class SubmissionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    current_user.submissions << Submission.create(submission_params)
    redirect_to submissions_path
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :link, :description, :user_id)
  end
end
