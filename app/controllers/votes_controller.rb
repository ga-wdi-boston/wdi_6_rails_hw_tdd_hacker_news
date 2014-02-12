class VotesController < ApplicationController
  before_action :set_votable

  def vote_up
    vote = @votable.votes.new(direction: true, user_id: current_user.id)
    if art_id = params[:article_id]
      article = Article.find(art_id)
    end
    if vote.save
      flash[:notice] = 'Voted up!'
      if @votable.is_a?(Article)
        redirect_to root_path
      else
        redirect_to [article, :comments]
      end
    else
      flash[:notice] = 'Already voted!'
      if @votable.is_a?(Article)
        redirect_to root_path
      else
        redirect_to [article, :comments]
      end
    end
  end

  def vote_down
    vote = @votable.votes.new(direction: false, user_id: current_user.id)
    if art_id = params[:article_id]
      article = Article.find(art_id)
    end
    if vote.save
      flash[:notice] = 'Voted down!'
      if @votable.is_a?(Article)
        redirect_to root_path
      else
        redirect_to [article, :comments]
      end
    else
      flash[:notice] = 'Already voted!'
      if @votable.is_a?(Article)
        redirect_to root_path
      else
        redirect_to [article, :comments]
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
