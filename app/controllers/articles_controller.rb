class ArticlesController < ApplicationController
	before_filter :authenticate_user!, :except => [:index]

	def index
		@articles = Article.all
		# includes(:user)
		@articles.sort! { |x, y| y.vote_tally <=> x.vote_tally }
	end

	def new
		@article = Article.new
	end

	def create
 		@article = Article.new(article_params)
			if @article.save
 				flash[:notice] = 'New article created!'
 				redirect_to action: :index
 			else
 				render :new
 			end
 	end

	private

 	def article_params
 		params.require(:article).permit(:description, :link)
 	end
end
