class VotesController < ApplicationController
  before_action :set_votable

	def up_vote
		if user_signed_in?
			vote = @votable.votes.find_or_create_by(user_id: current_user.id)
		  vote.direction = true
		  if article_id = params[:article_id]
	    	article = Article.find(article_id)
	    end
		  if vote.save
		    flash[:notice] = 'vote was successfully created - up vote.'
		    	if @votable.is_a?(Article)
	        	return redirect_to root_path
	      	else
	        	return redirect_to [article, :comments]
	      	end
	    else
	    	flash[:notice] = 'something went wrong.'
		  end
		else
			redirect_to root_path
			flash[:notice] = 'please sign in!'
		end
	end

	def down_vote
		if user_signed_in?
		  vote = @votable.votes.find_or_create_by(user_id: current_user.id)
		  vote.direction = false
		  if article_id = params[:article_id]
	    	article = Article.find(article_id)
	    end
		  if vote.save
		    flash[:notice] = 'vote was successfully created - down vote.'
		    	if @votable.is_a?(Article)
		      	redirect_to root_path
		    	else
		      	redirect_to [article, :comments]
		    	end
	    else
	    	flash[:notice] = 'something went wrong.'
		  end
		else
			redirect_to root_path
			flash[:notice] = 'please sign in!'
		end
	end

	private

	def set_votable
    @votable = params[:votable].classify.constantize.find(votable_id)
  end

  def votable_id
    params[(params[:votable] + "_id").to_sym]
  end

  def vote_params
    params.permit(:votable_id, :votable_type)
	end
end





