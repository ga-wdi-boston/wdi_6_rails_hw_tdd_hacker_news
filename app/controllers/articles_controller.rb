class ArticlesController < ApplicationController

	def index
		@articles = Article.all.sort { |x,y|
			x.votes.select { |vote| vote.direction === true }.count <=> y.votes.select { |vote| vote.direction === true }.count
		}.reverse
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
