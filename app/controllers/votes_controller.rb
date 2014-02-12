class VotesController < ApplicationController
  before_action :set_votable

  def vote_up
    vote = @votable.votes.new(direction: true)
    if vote.save
      flash[:notice] = 'Voted up!'
      redirect_to root_path
    else
      flash[:notice] = 'Already voted!'
      redirect_to root_path
    end
  end

  def vote_down
  end

  private

  def set_votable
       @votable = params[:votable].classify.constantize.find(votable_id)
       #  lower-case string of computer => Camelcase Computer => Computer class
  end
  def votable_id
       params[(params[:votable] + "_id").to_sym]
  end
end
