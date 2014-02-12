class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_votable
  def new
    @vote = Vote.new
  end

  def create

    vote = @votable.votes.new(direction: true)
    if vote.save
      flash[:notice] = 'Voted up!'
      redirect_to root_path
    else
      flash[:notice] = 'Already voted!'
      redirect_to root_path
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

  def vote_params
    params.require(:vote).permit(:direction, :votable_id, :votable_type, :user_id)
  end
end
