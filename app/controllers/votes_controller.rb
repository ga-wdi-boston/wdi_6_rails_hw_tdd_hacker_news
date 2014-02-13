class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_voteable # Gives us @voteable on all actions


  # GET /votes/new
  def new
    par = params[:baz]
    if par =="up"
      @vote = Vote.new(voteable_type: params[:voteable].classify, user_id: current_user.id)
      @vote.direction = true
      if @voteable.votes << @vote
        flash[:miig] = "success"
      else
        flash[:miig] = "you've already upvote"
      end
      
      redirect_to :back
    elsif par == "down"
      @vote = Vote.new(voteable_type: params[:voteable].classify, user_id: current_user.id)
      @vote.direction = false
      @voteable.votes << @vote
      redirect_to :back
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def set_voteable
      @voteable = params[:voteable].classify.constantize.find(voteable_id)
    end

    def voteable_id
      params[(params[:voteable] + "_id").to_sym]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:content)
    end
end
