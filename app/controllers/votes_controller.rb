class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_votable
  def new
    @vote = Vote.new
  end

  def create
    vote = @votable.votes.new(direction: true, user_id: current_user.id)
    if vote.save
      flash[:notice] = 'Voted up!'
      if @votable.class == Submission
        redirect_to root_path
      elsif @votable.class == Comment
        redirect_to submission_comments_path(@votable.submission)
      end
    else
      flash[:notice] = 'Already voted!'
      if @votable.class == Submission
        redirect_to root_path
      elsif @votable.class == Comment
        redirect_to submission_comments_path(@votable.submission)
      end
    end
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_votable
    @votable = params[:votable].classify.constantize.find(votable_id)
  end

  def votable_id
    params[(params[:votable] + "_id").to_sym]
  end
end
