class VotesController < ApplicationController
  before_action :set_votable

  def create
    # get the direction
    direction = params[:direction]
    vote = Vote.find_or_initialize_by(user: current_user, votable: @votable)
    # set the article if there is one (for redirection back to comments index)
    if article_id = params[:article_id]
      article = Article.find(article_id)
    end
    # ok go ahead and vote
    if !vote.persisted?
      vote.direction = direction
      vote.save
      flash[:notice] = 'Voted!'
      # redirect path is determined where the user voted
      if @votable.is_a? Comment
        redirect_to [article, :comments]
      else
        redirect_to root_path
      end
    else
      flash[:notice] = 'Already voted!'
      # redirect path is determined where the user voted
      if @votable.is_a? Comment
        redirect_to [article, :comments]
      else
        redirect_to root_path
      end
    end
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
