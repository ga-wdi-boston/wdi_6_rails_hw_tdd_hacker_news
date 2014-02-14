class ArticlesController < ApplicationController

	def index
		#should move logic to model
		@articles = Article.includes(:votes)
		@articles.sort! { |a, b| b.count_votes <=> a.count_votes }
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

		def create
			@article = Article.new(article_params)
			@article.save
			if @article.save
				redirect_to articles_path
			else
				render :new
			end
		end

		private

		def article_params
			params.require(:article).permit(:title, :blurb, :url)
		end
end
