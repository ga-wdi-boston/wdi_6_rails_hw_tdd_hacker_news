class VotesController < ApplicationController
  # before_action :set_vote, only: [:edit, :update]
  #before_action :set_votable

  def up_vote
    @vote = Vote.new(vote_params)
    @vote.direction = true
    if @vote.save
      redirect_to root_path, notice: 'vote was successfully created.'
    end
  end

  def down_vote
    @vote = Vote.new(vote_params)
    @vote.direction = false
    if @vote.save
      redirect_to root_path, notice: 'vote was successfully created.'
    end
  end

  def edit
  end

  def create
    @vote = @votable.votes.new(vote_params)
    respond_to do |format|
      if @vote.save
        format.html { redirect_to [@votable, @vote], notice: 'vote was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to [@votable, @vote], notice: 'vote was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to [@votable, :votes] }
    end
  end

  private
    def set_vote
      @vote = vote.find(params[:id])
    end

    def set_voteable
      @votable = params[:votable].classify.constantize.find(votable_id)
    end

    def voteable_id
      params[(params[:votable] + "_id").to_sym]
    end

    def vote_params
      params.permit(:votable_id, :votable_type)
    end
end
