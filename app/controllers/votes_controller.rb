class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_votable # Gives us @votable on all actions


  def create

    if params[:direction] == 'true'
      @vote = @votable.votes.new(direction: true, user: current_user )
    else
      @vote = @votable.votes.new(direction: false, user: current_user )
    end

    if @vote.save
      redirect_to :back
    else
      flash[:errors] = @vote.errors.full_messages.join(', ')
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
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
      params.require(:vote).permit(:direction)
    end
end
