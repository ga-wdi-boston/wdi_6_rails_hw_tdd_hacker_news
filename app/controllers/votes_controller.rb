class VotesController < ApplicationController
  before_action :set_vote
  before_action :set_votable
 def new
  @vote = Vote.new
 end

 def create
  @submission = Submission.find(params[:id])
  @submission.votes << Vote.create(vote_params)
 end

 private

  def set_vote
    @votable = Vote.find(params[:id])
  end

  def set_votable
    @votable = params[:votable].classify.constantize.find(votable_id)
  end

  def votable_id
    params[(params[:votable] + "_id").to_sym]
  end

 def vote_params
  params.require(:vote).permit(:direction, :votable_id, :votable_type, :user_id)
 end
end
